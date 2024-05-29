<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbp.model.DTO.Member"%>
<%@ page import="com.nbp.model.DAO.MemberDAO" %>
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
	String MemberId=loginMember.getMemberId();
	
	Cookie[] cookies=request.getCookies();
	String saveId=null;
	if(cookies!=null){
	   for(Cookie c : cookies){
	      if(c.getName().equals("saveId")){
	         saveId=c.getValue();
	         break;
	      }
	   }
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫차: 장바구니</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f8f8;
    }
    header {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        text-align: center;
    }
    .container {
        max-width: 1200px;
        margin: 20px auto;
        padding: 0 20px;
        text-align: center;
    }
    .cart-item {
        display: flex;
        margin-bottom: 20px;
        align-items: center;
        padding: 10px;
        background-color: white;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        display: none; /* Initially hide all cart items */
    }
    .cart-item img {
        width: 150px;
        height: 150px;
        object-fit: cover;
        margin-right: 10px;
    }
    .item-details {
        flex-grow: 1;
        padding: 20px;
        position: relative;
    }
    .item-details h3 {
        margin: 0 0 10px;
        font-size: 1.2em;
    }
    .item-details p {
        margin: 5px 0;
        color: #555;
    }
    .item-details .price {
        color: #e60023;
        font-size: 1.2em;
        margin-top: 10px;
    }
    .item-details .buttons {
        position: absolute;
        top: 20px;
        right: 20px;
        display: flex;
        gap: 10px;
    }
    .item-details .buttons button {
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .item-details .buttons .delete-btn {
        background-color: #e60023;
        color: white;
    }
    .item-details .buttons .order-btn {
        background-color: #4CAF50;
        color: white;
    }
    .bulk-order {
        text-align: right;
        margin: 20px 0;
    }
    .bulk-order button {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
    }
    .total-price {
        text-align: right;
        margin: 20px 0;
        font-size: 1.5em;
    }
    .empty-cart-message {
        margin-top: 50px;
        font-size: 1.5em;
        color: #555;
    }
</style>
<body>
<header>
    <h1>장바구니</h1>
</header>
<div class="container">
    <div class="empty-cart-message">장바구니에 담긴 물건이 없습니다</div>
    <div class="cart-item">
        <input type="checkbox" class="cart-checkbox" data-price="20000">
        <img src="https://i.imgur.com/RnOgrKc.png" alt="상품 이미지">
        <div class="item-details">
            <h3>상품 이름 1 <span class="option">(옵션 1)</span></h3>
            <p>장바구니 추가 날짜: 2024-05-28</p>
            <p class="price">₩20,000</p>
            <div class="buttons">
                <button class="delete-btn">삭제</button>
                <button class="order-btn">주문하기</button>
            </div>
        </div>
    </div>
    <div class="cart-item">
        <input type="checkbox" class="cart-checkbox" data-price="35000">
        <img src="https://i.imgur.com/RnOgrKc.png" alt="상품 이미지">
        <div class="item-details">
            <h3>상품 이름 2 <span class="option">(옵션 2)</span></h3>
            <p>장바구니 추가 날짜: 2024-05-27</p>
            <p class="price">₩35,000</p>
            <div class="buttons">
                <button class="delete-btn">삭제</button>
                <button class="order-btn">주문하기</button>
            </div>
        </div>
    </div>
    <div class="cart-item">
        <input type="checkbox" class="cart-checkbox" data-price="15000">
        <img src="https://i.imgur.com/RnOgrKc.png" alt="상품 이미지">
        <div class="item-details">
            <h3>상품 이름 3 <span class="option">(옵션 3)</span></h3>
            <p>장바구니 추가 날짜: 2024-05-26</p>
            <p class="price">₩15,000</p>
            <div class="buttons">
                <button class="delete-btn">삭제</button>
                <button class="order-btn">주문하기</button>
            </div>
        </div>
    </div>
    <div class="total-price">
        총 가격: ₩<span id="totalPrice">0</span>
    </div>
    <div class="bulk-order">
        <button onclick="bulkOrder()">전체 주문하기</button>
    </div>
</div>
<script>
    function updateTotalPrice() {
        const checkboxes = document.querySelectorAll('.cart-checkbox:checked');
        let totalPrice = 0;
        checkboxes.forEach(checkbox => {
            totalPrice += parseInt(checkbox.getAttribute('data-price'));
        });
        document.getElementById('totalPrice').innerText = totalPrice.toLocaleString();
    }

    document.querySelectorAll('.cart-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', updateTotalPrice);
    });

    function bulkOrder() {
        const checkboxes = document.querySelectorAll('.cart-checkbox:checked');
        if (checkboxes.length === 0) {
            alert('주문할 상품을 선택하세요.');
            return;
        }
        let orderItems = [];
        checkboxes.forEach(checkbox => {
            const itemDetails = checkbox.parentElement.querySelector('.item-details');
            const itemName = itemDetails.querySelector('h3').innerText;
            const itemPrice = itemDetails.querySelector('.price').innerText;
            orderItems.push({name: itemName, price: itemPrice});
        });
        console.log('주문할 상품 목록:', orderItems);
        alert('주문이 완료되었습니다.');
    }

    function addItem(name, option, date, price, imageUrl) {
        const container = document.querySelector('.container');
        const newItem = document.createElement('div');
        newItem.className = 'cart-item';
        newItem.innerHTML = `
            <input type="checkbox" class="cart-checkbox" data-price="${price}">
            <img src="${imageUrl}" alt="상품 이미지">
            <div class="item-details">
                <h3>${name} <span class="option">(${option})</span></h3>
                <p>장바구니 추가 날짜: ${date}</p>
                <p class="price">₩${price.toLocaleString()}</p>
                <div class="buttons">
                    <button class="delete-btn">삭제</button>
                    <button class="order-btn">주문하기</button>
                </div>
            </div>
        `;
        container.insertBefore(newItem, container.querySelector('.total-price'));
        document.querySelector('.empty-cart-message').style.display = 'none';
        newItem.style.display = 'flex';
        
        // Attach event listener for the new checkbox
        newItem.querySelector('.cart-checkbox').addEventListener('change', updateTotalPrice);
    }

    // Example: Add an item to the cart
    // addItem('상품 이름 4', '옵션 4', '2024-05-29', 30000, 'image4.jpg');
</script>
</body>
</html>
