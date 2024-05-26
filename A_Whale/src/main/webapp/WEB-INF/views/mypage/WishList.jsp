<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nbp.wishlist.model.dto.WishlistDto,java.util.List" %>
<%@ include file="/WEB-INF/common/header.jsp" %> 
<%List<WishlistDto> wishlist=(List<WishlistDto>)request.getAttribute("wishlist");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



    <style>
      
      
      .wishlist_all * {
        box-sizing: border-box;
      }
      
      .wishlist_all p, span {
        margin: 0;
      }
      
      .wishlist_all a {
        color: black;
      }
      
      .wishlist_all img {
        display: block;
        /* width: 80%; */
        height: 80px;
        margin: auto;
      } 
        .wishlist_all{

            width: 1300px;
            margin: auto;
            padding-left: 30px;
            padding-right: 30px;
        }
        .wishlist_head{
        	margin-top: 100px;
        	height: 50px;
            border-bottom: 1.5px solid black;
            
        }
        .wishlist_head_totaldata{
        	margin-top: 30px;
        	margin-bottom: 30px;
        
        }

    	.wishlist__bigorderbtn {
        
        width: 200px;
        height: 50px;
        font-size: 16px;
        margin: auto;
        border-radius: 5px;
      }

      .wishlist__bigorderbtn.left {
        background-color: white;
        border: 1px lightgray solid;
      }
      .wishlist__bigorderbtn.right {
        background-color: blue;
        border: none;
        color: aliceblue;
      }
      .wishlist_img{
        display: flex;
        margin-bottom: 50px;
      }
      .wishlist_all ul {
        background-color: white;
        padding: 30px;
        margin-bottom: 50px;
        border: whitesmoke solid 1px;
        border-radius: 5px;
        font-size: 13px;
        font-weight: 300;
      }
      
      .wishlist_all ul :first-child {
        color: blue;
      }
      

     
      .itemcart{
        /* width: 80%; */
        margin: auto;
        /* padding-left: 30px;
        padding-right: 30px; */
        border-top: lightgray 1px solid;
        /* display: flex; */
        
      }
      .wishlist_cart{
        border-bottom: 1.5px solid black;
        
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        
        padding-bottom: 80px;
        
      }
  
     
     
      .wishlist__items{
        margin-top: 50px;
        margin-left: 68px;
        margin-right: 68px;
      }
      .wishlist__items>img{
        width: 186px;
        height: 279px;
      }
     
      .wishlist__items__pbox>div:first-child{
        font-weight: bold;
        padding-top: 20px;
        padding-bottom: 10px;
      }
      .wishlist__items__pbox>p:nth-child(2){
        padding-bottom: 5px;
        
      }

   
      .button_box{
        display: flex;
      }
      .continue_button{
        padding-top: 70px;
        height: 250px;
      }
      .delete_button{
        padding-top: 70px;
        height: 250px;
        padding-left: 10px;
      }
      .pageBar{
        padding-top: 30px;
        display: flex;
        justify-content: center;
      }
      
    </style>
    
</head>
<body>

<div class="wishlist_all">
    <div class="wishlist_head">
        <h4>관심상품</h4>
    </div>
    <div class="wishlist_head_totaldata"><h5>전체 <%=request.getAttribute("totalData")%>건</h5></div>
    <div>
       <ul>
                <li>A.WHALE 사이트에서 등록하신 관심상품 리스트 입니다.</li>
                <li>최대 48개 등록 가능합니다.</li>
                
        </ul>
    </div>
    <div class="wishlist_cart">
    
           <%if(!wishlist.isEmpty()) {
           		for(WishlistDto w:wishlist){%>
				<div class="wishlist__items">
              <img src="<%=w.getPImgUrl()%>">
              <div class="wishlist__items__pbox">
                <div>
                  <label><%=w.getProductBrand() %>
                  <input type="checkbox" name="deletecheck" value="<%=w.getWishListId()%>" />
                  <input type="hidden" name="cartinsertcheck" value="<%=w.getProductId()%>">
                  </label>
                </div>
              <p><%=w.getProductName() %></p>
              <p><%=w.getProductprice() %></p>
              </div>
          	  </div>           			
           			<%}
           		}%>
          		
    </div>
    <div class="pageBar">
      <div><%=request.getAttribute("pageBar") %></div>
      
    </div>
    <div class="button_box">
      <div class="continue_button">
          <button class="wishlist__bigorderbtn left" onclick="basketbutton();">장바구니 담기</button>
      </div>
      <div class="delete_button">
        <button class="wishlist__bigorderbtn right" onclick="deletebutton();">삭제하기</button>
      </div>
    </div>
    
</div>
	<script>
	const basketbutton=()=>{
		let checkdeletecheck=document.getElementsByName("deletecheck");
		let cartinsertcheck=document.getElementsByName("cartinsertcheck");
		let result=new Array();
		for(let i=0; i<checkdeletecheck.length;i++){
	    	 if(checkdeletecheck[i].checked){
	    	 	result.push(cartinsertcheck[i].value);
	    	  }
	       }
		   var url ='<%=request.getContextPath()%>/wishlist/insertbasketsenter.do?baskets='+result;
           var windowName = "장바구니등록";
           var windowFeatures = "width=400,height=250,resizable=yes,scrollbars=yes";
           window.open(url,windowName,windowFeatures);

      		console.log(result);
	        <%-- location.assign('<%=request.getContextPath()%>/wishlist/insertbasketsenter.do?baskets='+result); --%> 
		
	}
	
	const deletebutton=()=>{
        let checkdeletecheck=document.getElementsByName("deletecheck");
        let result=new Array();
      	
        for(let i=0; i<checkdeletecheck.length;i++){
	    	 if(checkdeletecheck[i].checked){
	    	 	result.push(checkdeletecheck[i].value);
	    	  }
	       }
       		
	       location.assign('<%=request.getContextPath()%>/wishlist/deletewish.do?deleteArr='+result);
       }
	
      
	</script>
	
</body>
</html>