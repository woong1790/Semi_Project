<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbp.model.DTO.Member"%>
<%@ page import="com.nbp.model.DAO.MemberDAO" %>
<%@ page import="com.nbp.cart.model.DTO.Cart" %>
<%@ page import="java.util.*,com.nbp.cart.model.DAO.CartDAO,com.google.gson.Gson" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.NumberFormat"%>

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
	
	List<Cart> carts=(List<Cart>)request.getAttribute("carts");
	//out.print(carts);
	Gson gson=new Gson();
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = simpleDate.format(date);
	int totalPrice=0;
	NumberFormat numberFormat = NumberFormat.getInstance();
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
        text-align: center;
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
        text-align: center;
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
	<%if(carts.isEmpty()) {%>
    <div class="empty-cart-message">장바구니에 담긴 물건이 없습니다</div>
    <%}else{ %>
    	<%for(Cart c:carts){
    		String[] option=gson.fromJson(c.getOptionName(),String[].class);
    		String[] price=gson.fromJson(c.getOptionPrice(),String[].class);
    		int[] intPrice = new int[price.length];
    	
    		for(int i=0;i<price.length; i++){
    			intPrice[i]=Integer.parseInt(price[i].replace(",",""));
    		}
    		%>
    		<!-- 장바구니에 담긴 각 ROW -->	
		    <div class="cart-item">
		        <input type="checkbox" class="cart-checkbox" data-price="<%=totalPrice%>">
		        <img src="<%=c.getProductImg() %>" alt="상품 이미지">
		        <div class="item-details">		        
		            <h3><%=c.getProductName() %>: <%=c.getCartVolume()%>개</h3>
		            추가된 옵션:
		            <%for(int i=0;i<option.length;i++){
		            	if(i!=0){%>
		            		<span class="option"><%=i>1?",":""%><%=option[i]%></span>
		            	<%} 
		            }%>
		            
		            <p class="price">결제 금액: 
		            <% 
				        for(int i=0; i<intPrice.length; i++) {
				            totalPrice += intPrice[i]; // 각 상품의 가격을 누적합니다.
				        %>
				    <% } %>
				    <%=totalPrice %>원
		            </p>
		            <p>장바구니 추가 날짜: <%=strDate%></p>
		            <div class="buttons">
		                <button class="delete-btn">삭제</button>
		                <button class="order-btn">주문하기</button>
		            </div>
		        </div>
		    </div>
		    <% }%>
    <%} %>
    
    <div class="total-price">
        총 결제금액: <span id="totalPrice">0</span>원
    </div>
    
    <div class="bulk-order">
        <button onclick="bulkOrder()">전체 주문하기</button>
    </div>
    
</div>

<script>
    function updateTotalPrice() {
        const checkboxes = document.querySelectorAll('.cart-checkbox:checked');
        let TotalPrice = 0;
        checkboxes.forEach(checkbox => {
            TotalPrice += <%=totalPrice%>;
        });
        document.getElementById('totalPrice').innerText = TotalPrice;
    }

    document.querySelectorAll('.cart-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', updateTotalPrice);
    });

    function bulkOrder() {
        const checkboxes = document.querySelectorAll('.cart-checkbox:checked');
        if (checkboxes.length = 0) {
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

    	document.querySelectorAll('.cart-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', updateTotalPrice);
    });
   
</script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</body>
</html>
