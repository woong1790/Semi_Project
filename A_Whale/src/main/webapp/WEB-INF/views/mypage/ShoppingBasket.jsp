<%@page import="com.nbp.product.model.DTO.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/header.jsp" %>
<%@ page import="com.nbp.shoppingbasket.model.dto.ShoppingBasketDto,java.util.List"%>    
<%List<ShoppingBasketDto> list=(List<ShoppingBasketDto>)request.getAttribute("shoppingbasketlist");%>
<%List<Product> productlist=(List<Product>)request.getAttribute("productlist");%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<style>
      .main {
        margin: 0;
        padding-top: 50px;
        width: 1600px;
      }
      
      .main * {
        box-sizing: border-box;
        
      }
      
      .main p,span {
        margin: 0;
      }
      
      .main a {
        color: black;
      }
      
     .cart__list img {
        display: block;
        /* width: 80%; */
        height: 80px;
        width:60px;
        margin: auto;
      } 
      .cartHead{
      	
        width: 80%;
        margin: auto;
        padding-left: 30px;
        padding-right: 30px;
        
      }
      .cart {
      	
        width: 80%;
        margin: auto;
        padding: 30px;
        padding-top: 0;
        padding-bottom: 0;
      }
      
      .cart ul {
        background-color: white;
        padding: 30px;
        margin-bottom: 30px;
        border: whitesmoke solid 1px;
        border-radius: 5px;
        font-size: 13px;
        font-weight: 300;
      }
      
      .cart ul :first-child {
        color: blue;
      }
      
      .main table {
        border-top: solid 1.5px black;
        border-collapse: collapse;
        width: 100%;
        font-size: 14px;
        
      }
      
      .main thead {
        text-align: center;
        font-weight: bold;
      }
      
      .main tbody {
        font-size: 12px;
      }
      
      .main td {
        padding: 15px 0px;
        border-bottom: 1px solid lightgrey;
      }
      
      .cart__list__detail :nth-child(3) {
        vertical-align: top;
      }
      
      .cart__list__detail :nth-child(3) a {
        font-size: 12px;
      }
      
      .cart__list__detail :nth-child(3) p {
        margin-top: 6px;
        font-weight: bold;
      }
      
      .cart__list__smartstore {
        font-size: 12px;
        color: gray;
      }
      
      .cart__list__option {
        vertical-align: top;
        padding: 20px;
        
      }
      
      .cart__list__option p {
        margin-bottom: 25px;
        position: relative;
      }
      
      .cart__list__option p::after {
        content: "";
        width: 90%;
        height: 1px;
        background-color: lightgrey;
        left: 0px;
        top: 25px;
        position: absolute;
      }
      
      .cart__list__optionbtn {
        background-color: white;
        font-size: 10px;
        border: lightgrey solid 1px;
        padding: 7px;
      }
      
      
      .cart__list__detail td:nth-child(4),
      .cart__list__detail td:nth-child(5),
      .cart__list__detail td:nth-child(6) {
        border-left: 2px solid lightgray;
      }
      
      .cart__list__detail :nth-child(5),
      .cart__list__detail :nth-child(6) {
        text-align: center;
      }
      
      .cart__list__detail :nth-child(5) button {
        background-color: blue;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 4px 8px;
        font-size: 12px;
        margin-top: 5px;
      }
      
      .price {
        font-weight: bold;
      }
      
      .discount{
        text-decoration: line-through; 
        color: lightgray;
      }
      .cart__mainbtns {
        width: 420px;
        height: 200px;
        padding-top: 40px;
        display: block;
        margin: auto;
        
      }
      
      .cart__bigorderbtn {
        width: 200px;
        height: 50px;
        font-size: 16px;
        margin-top: 30px;

        border-radius: 5px;
      }
      
      .cart__bigorderbtn.left {
        background-color: white;
        border: 1px lightgray solid;
      }
      
      .cart__bigorderbtn.right {
        background-color: blue;
        color: white;
        border: none;
      }
      .cart__information{
        padding-top: 0;
      }
      .clac{
        padding-top: 29px;
        padding-bottom: 29px;
        padding-left: 20px;
        padding-right: 20px;
        display: flex;
        
        justify-content: center; /* 수평 가운데 정렬 */
        align-items: center; /* 수직 가운데 정렬 */
        background-color: whitesmoke;
        border-bottom: 1px lightgrey solid;
      }
      .clac-block{
      
      }
      .plusmi{
        padding-left: 20px;
        padding-right: 20px;

      }
  
      .bestitem_img{
        width: 186px;
        height: 279px;
      }
      .itemcart{
        /* width: 80%; */
        margin: auto;
        /* padding-left: 30px;
        padding-right: 30px; */
        border-top: black 1.5px solid;
        /* display: flex; */
        
      }
      .bestitem{
        padding-top: 50px;
        height: 700px;
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap; 
        justify-content: space-evenly;
       	width: 1220px;
      }
      .bestitem_pbox>p:first-child{
        font-weight: bold;
        padding-top: 20px;
        padding-bottom: 10px;}
      
      .bestitem_pbox>p:nth-child(2){
        padding-bottom: 5px;
      }
      
      .quantity{
        text-align:center;
        width: 10%;
      }
      
      .quantity_box_num{
        text-align:center; 
        width: 20px;
      }
      
       .cart__list__detail>td:nth-child(1){
        width: 20px;
      }
      
      .cart__list__detail>td:nth-child(2){
        width: 100px;
      }
     	
       .cart__list__detail>td:nth-child(4){
        width: 160px;
      }
      
       .cart__list__detail>td:nth-child(5){
        width: 160px;
      }
      
       .cart__list__detail>td:nth-child(6){
        width: 160px;
      }
      .all_check{
      	margin-right: 5px;
      	margin-bottom: 20px;
      }
      .itemcart_head{
      	display: flex;
      	  flex-direction: row;
        flex-wrap: nowrap; 
        justify-content: space-between;
      }
      
      
          /* 캐러셀 전체 구조  */
.carousel_main {
    width: 1250px; /* 이미지 크기 설정  */
    position: relative;
    overflow: hidden;
    margin: 0;
    user-select: none;
    height: 500px;
}

.carousel_wrapper {
    display: flex;
    transition: transform 1s;
}

.carousel_slide {
    flex: 0 0 1220px; /* 이미지 크기 설정  */
    position: relative;
    display: flex;
        flex-direction: row;
        flex-wrap: wrap; 
        justify-content: space-evenly;

}



/* 캐러셀 사이드 버튼 */
.carousel_button_container {
  
  
  
    display: flex;
    justify-content: space-between; 
    width: 90px;
}

.carousel_button {
    width: 50px;
    height: 50px;
    color: #fff;
    background: transparent;
    border: none;
    outline: none;
    cursor: pointer;
}

.carousel_prev {
    background-color: rgba(0, 0, 0, 0.15);
    border: 0px;
    padding-top: 5px;
    padding-bottom: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
}

.carousel_next {
    background-color: rgba(0, 0, 0, 0.15);
    border: 0px;
    padding-top: 5px;
    padding-bottom: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    margin-left: 20px;
}
/* 캐러셀 중앙 버튼 */
.carousel_pagination {
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
}

.carousel_circle {
    width: 10px;
    height: 10px;
    background-color: #aaa;
    border-radius: 50%;
    margin: 0 5px;
    cursor: pointer;
}

.carousel_circle.active {
    background-color: #333;
}
.aaa111{
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap; 
        justify-content: space-evenly;

      }
</style>      

</head>
<body>
<section class="main">
    <div class="cartHead" style="height: 80px; display: flex;">
        <div style="width: 20%; display: flex; align-items: center;  "><h4>장바구니</h4></div>
        <div style="width: 50%; "></div>
        <div style="width: 30%;  display: flex; align-items: center; justify-content: flex-end; "><h4>장바구니 > 주문서작성 > 결제완료</h4></div>
        
    </div> 
    <div class="cartHead" style="height: 40px;">
        <div style=" border-bottom: 1.5px solid black; width: 100%;"></div>
         

    </div> 
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>최대 5개 등록 가능하며, 이후 가장 오래전 등록된 장바구니부터 순차적으로 삭제됩니다.</li>
                <li>품절이나 판매 중단 상품은 목록에서 자동 삭제됩니다.</li>
            </ul>
        </div>
        <div style="display: flex; flex-direction: row;"> 
        <input type="checkbox" name="basketcheck" class="all_check"><h5>전체선택</h5></div>   
        <table class="cart__list">
            
                <thead>
                    <tr>
                        <td></td>
                        <td colspan="2">상품정보</td>
                        <td>수량</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                <% if(list.isEmpty()){%>
                
                <%}else{ 
                	for(ShoppingBasketDto s:list){ %>
 						<tr class="cart__list__detail">
 						<td><input type="checkbox" name="basketCheck" value="<%=s.getCartNo()%>">
 						<input type="hidden" name="productval" value="<%=s.getProductId()%>"> </td>
 						<td><img src="<%=s.getPImgUrl()%>"></td>	
 						<td><a href="#"><%=s.getProductBrand()%></a><span class="cart__list__smartstore"><%=s.getProductBrand()%></span>				 	               
                			<p><%=s.getProductName() %></p>
                			<span class="price"><%=s.getProductprice() %></span>
             			</td>
             			<td class="quantity">
                            
                          <div>
                            <button type="button" onclick="fnCalCount();">-</button>
                            <input type="text" name="quantity_num" value="0" class="quantity_box_num" readonly>
                            <button type="button" onclick="fnCalCount();">+</button>
                          </div>   
                        </td>
                        <td><span class="price"><%=s.getProductprice() %></span><br>
                            <button type="button" class="cart__list__orderbtn">주문하기</button>
                        </td>
                        <%if(list.size()>1) {%>
                        <td>무료</td>
                        <%} else{ %>
                        <td>3,000</td>
                        <%} %>
                        </tr>
                	<%}
                }%>
                   
                    
                </tbody>
                <tfoot style="border-top: 1.5px black solid;">
                    <tr>
                        <td colspan="3"> <button type="button" class="cart__list__optionbtn" onclick="deleteBasket();">선택상품 삭제</button>
                            <button type="button" class="cart__list__optionbtn" onclick="BasketToWish();">선택상품 위시리스트</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            
        </table>
        <div class="clac">
          <div class="clac-block">
            <b>229,600</b>원<span class="plusmi">+</span><strong>배송비 무료</strong><span class="plusmi">=</span><b>229,600</b>원
          </div>

        </div>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right">주문하기</button>
        </div>
        <div class="itemcart">
      	<div class="itemcart_head" style="padding-top: 30px;">
            <div><h4>BEST ITEM</h4></div>
            
				 <div class="carousel_button_container">
	              <button type="button" class="carousel_prev">
	                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
	                      <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
	                      <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
	                  </svg>
	              </button>
	              <button type="button" class="carousel_next">
	                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
	                      <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
	                      <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
	                  </svg>
	              </button>
	          </div>
            
          </div>
          <div class="bestitem">
	          <div class="carousel_main">
	          <div class="carousel_wrapper">
	              
	                 <%if(!productlist.isEmpty()){ %>
	                 <%for(int i=0; i<productlist.size(); i++) {%>
	                 	<% if(i==0){%>
	                 		<div class="carousel_slide">
	                 	<%}else if(i==5){%>
	                 		</div>
	                 		<div class="carousel_slide">
						<%}else if(i==10){ %>
							</div>
	                 		<div class="carousel_slide">
						<%} %>	                 	
	                 	<div>
	                 		<img class="bestitem_img" src="<%=productlist.get(i).getProductImg()%>">
	                 		  <div class="bestitem_pbox">
		                          <p><%=productlist.get(i).getProductBrand() %></p>
		                          <p><%=productlist.get(i).getProductName()%></p>
		                          <p><%=productlist.get(i).getProductPrice() %></p>
	                          </div>	
	                 	</div>
	                 	<%if(i==14){%>
	                 	</div>
	                 	<%} %>
	                 <%}
	                 }%>
	              
	          </div>
	         
	          <div class="carousel_pagination">
	              <div class="carousel_circle"></div>
	              <div class="carousel_circle"></div>
	              <div class="carousel_circle"></div>
	            
	          </div>
	      </div>
          
            
          </div>
          </div>
    
       
    </section>
  </section> 
  
  
  
  
  
  
  
	<script>
	const deleteBasket=()=>{
        let checkdeletecheck=document.getElementsByName("basketCheck");
        let result=new Array();
      	
        for(let i=0; i<checkdeletecheck.length;i++){
	    	 if(checkdeletecheck[i].checked){
	    	 	result.push(checkdeletecheck[i].value);
	    	  }
	       }
       		console.log(result);
       	location.assign('<%=request.getContextPath()%>/shoppingbasket/deletebasket.do?deleteArr='+result); 
       }
	const BasketToWish=()=>{
		   let checkdeletecheck=document.getElementsByName("basketCheck");
		   let productval=document.getElementsByName("productval");
	        let result=new Array();
	        let result2=new Array();
	      	
	        for(let i=0; i<checkdeletecheck.length;i++){
		    	 if(checkdeletecheck[i].checked){
		    	 	result.push(checkdeletecheck[i].value);
		    	 	result2.push(productval[i].value);
		    	  }
		       }
	       		console.log(result2);
	       	location.assign('<%=request.getContextPath()%>/shoppingbasket/baskettowishenter.do?insertCartArr='+result+'&insertProductArr='+result2);  
		
	}
	

    const swiper = document.querySelector('.carousel_wrapper');
    const prevButtons = document.querySelectorAll('.carousel_prev');
    const nextButtons = document.querySelectorAll('.carousel_next');
    const bullets = document.querySelectorAll('.carousel_circle');
    
    let currentSlide = 0;
    
    function showSlide(slideIndex) {
        swiper.style.transform = `translateX(-\${slideIndex * 1220}px)`;
        currentSlide = slideIndex;
    
        bullets.forEach((bullet, index) => {
            if (index === currentSlide) {
                bullet.classList.add('active');
            } else {
                bullet.classList.remove('active');
            }
        });
    }
    
    prevButtons.forEach((prevButton) => {
        prevButton.addEventListener('click', () => {
            if (currentSlide > 0) {
                showSlide(currentSlide - 1);
            }
        });
    });
    
    nextButtons.forEach((nextButton) => {
        nextButton.addEventListener('click', () => {
            if (currentSlide < 2) {
                showSlide(currentSlide + 1);
            }
        });
    });
    
    bullets.forEach((bullet, index) => {
        bullet.addEventListener('click', () => {
            showSlide(index);
        });
    });
    
    showSlide(0);
    
	</script>
</body>
</html>