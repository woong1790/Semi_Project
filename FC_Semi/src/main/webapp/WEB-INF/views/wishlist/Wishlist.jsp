<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/common/subHeader.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<style>
        body {
            margin: 0;
            padding: 0;
            background-image: url("https://images.unsplash.com/photo-1629196911514-cfd8d628ba26?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .wishlist-item {
            display: flex;
            margin-bottom: 20px;
            align-items: center;
            padding: 10px;
        }
        .wishlist-item img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-right: 10px;
        }
        .item-details {
            flex-grow: 1;
            padding: 20px;
            position: relative;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .item-details h3 {
            margin: 0 0 10px;
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
            text-align: center;
            margin: 20px 0;
        }
        .bulk-order button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
        }
        
        #wishlist-title{
        	width:100%;
        	display:flex;
        	justify-content:center;
        	align-items:center;
        	margin-top:50px;
        	font-size:30px;
        	color:rgb(24, 24, 74);
        	font-family:KoPubWorldDotum;
        	font-weight:bolder;
        	text-shadow: 1px 1px 1px rgba(18, 14, 87, 0.5);
        }
    </style>
</head>
<body>
	<div id="wishlist-title"><div>WishList</div></div>
    <div class="container">
        <div class="wishlist-item">
            <input type="checkbox" class="wishlist-checkbox">
            <img src="https://i.imgur.com/EwzxUrT.png" alt="상품 이미지">
            <div class="item-details">
                <h3>상품 이름 1</h3>
                <p>찜한 날짜: 2024-05-28</p>
                <p class="price">₩20,000</p>
                <div class="buttons">
                    <button class="delete-btn">삭제</button>
                    <button class="order-btn">주문하기</button>
                </div>
            </div>
        </div>
        <div class="wishlist-item">
            <input type="checkbox" class="wishlist-checkbox">
            <img src="https://i.imgur.com/EwzxUrT.png" alt="상품 이미지">
            <div class="item-details">
                <h3>상품 이름 2</h3>
                <p>찜한 날짜: 2024-05-27</p>
                <p class="price">₩35,000</p>
                <div class="buttons">
                    <button class="delete-btn">삭제</button>
                    <button class="order-btn">주문하기</button>
                </div>
            </div>
        </div>
        <div class="wishlist-item">
            <input type="checkbox" class="wishlist-checkbox">
            <img src="https://i.imgur.com/EwzxUrT.png" alt="상품 이미지">
            <div class="item-details">
                <h3>상품 이름 3</h3>
                <p>찜한 날짜: 2024-05-26</p>
                <p class="price">₩15,000</p>
                <div class="buttons">
                    <button class="delete-btn">삭제</button>
                    <button class="order-btn">주문하기</button>
                </div>
            </div>
        </div>
        <div class="bulk-order">
            <button onclick="bulkOrder()"> <img src="https://i.imgur.com/4dp9pEu.png" width="120px"> </button>
        </div>
    </div>
    <script>
        function bulkOrder() {
            const checkboxes = document.querySelectorAll('.wishlist-checkbox:checked');
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
    </script>
</html>