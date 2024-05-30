<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, com.nbp.model.DTO.Member,java.text.SimpleDateFormat, com.nbp.product.model.DTO.Product" %>
<%
/* 	List<Product> products=(List<Product>)request.getAttribute("products");
 */	Member loginMember =(Member) (Member)session.getAttribute("loginMember");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<section id="productSection" style="width:100%; margin:20px 0px 20px 50px;">
       <div>
           <div>상품 등록</div>
       </div>
      	<div>
       	<button id="productSearchButton">상품 조회</button>
       	<div id="searchContainer" ></div>
       	</div>
   		<div class="container">
        <div class="product-title" style="display:flex;">
            <div style="width: 10%;"><strong>번호</strong></div>
            <div style="width: 10%;"><strong>상품사진</strong></div>
            <div style="width: 40%;"><strong>상품명</strong></div>
            <div style="width: 10%;"><strong>상품가격</strong></div>
            <div style="width: 10%;"><strong>브랜드</strong></div>
            <div style="width: 10%;"><strong>재고</strong></div>
            <div style="width: 10%;"><strong>등록일</strong></div>
        </div>
        <div class="product_content">
            <%-- <% if (products.isEmpty()) { %>
                <div>조회된 상품들이 없습니다</div>
            <% } else {
                for (Product p : products) { %>
                    <div>
                        <div class="product_no"><%= p.getProductNo() %></div>
                        <div class="product_img"><%= p.getProductImg() %></div>
                        <div class="product_name">
                             <a href="<%= request.getContextPath() %>/product/productInfo.do?no=<%= p.getProductNo() %>"><%= p.getProductName() %></a>
                        </div>
                        <div class="notice_price"><%= p.getProductPrice() %></div>
                        <div class="product_brand"><%= p.getProductBrand() %></div>
                        <div class="product_stock"><%= p.getProductStock() %></div>
                        <div class="product_enroll_date"><%= new SimpleDateFormat("yyyy-MM-dd").format(p.getProductEnrollDate()) %></div>
                    </div>
                <% }
            } %> --%>
        </div>
    </div>
      		
       	 	
       

       <div>
        	<button id="productInsertButton"> 상품 등록</button> 
       </div>
       <div id="insertContainer" class="form-container" style="border:1px solid black;">
	       <form action="<%=request.getContextPath() %>/product/productinsertend.do" 
	        method="post" enctype="multipart/form-data">
	            <!-- <div class="row1" >
	                <div class="row2" >
	                    상품번호
	                </div>
	                <div>
	                    <input class="form-control" type="number" name="productNo" required>
	                </div>
	            </div> -->
	            <div class="row1" >
	                <div class="row2" >
	                    상품명
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="productName" required>
	                </div>
	            </div>
	            <div class="row1" >
	                상품 서브명 <input type="text" name="productSubname" required><br>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    상품 브랜드
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="productBrand" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    상품 가격
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="productPrice" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    상품설명
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="productDetail" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    상품 원산지
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="productOrigin" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    상품 카테고리 이름
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="categoryName" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    상품 도수
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="productAlcoholLv" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    상품 년산
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="productAge" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    상품 년산
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="productVolume" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    상품재고
	                </div>
	                <div>
	                    <input class="form-control" type="text" name="productStock" required>
	                </div>
	            </div>
	            <div class="row1" >
	                <div class="row2" >
	                    이미지 파일1 상단
	                </div>
	                <div>
	                    <input class="form-control" type="file" name="productImg">
	                </div>
	            </div>
	            
	            
	            <div style="margin: 20px 0; text-align: center;">
	                <input type="submit" value="등록하기">
	            </div>
	        </form>
    	</div>
	    <!-- <label>상품명: <input type="text" name="productName" required></label><br>
        <label>상품 서브명: <input type="text" name="productSubname" required></label><br>
        <label>상품 설명: <input type="text" name="productDetail" required></label><br>
        <label>상품 가격: <input type="number" name="productPrice" required></label><br>
        <label>상품 재고: <input type="number" name="productStock" required></label><br>
        <label>알코올 도수: <input type="number" name="productAlcoholLv" required></label><br>
        <label>원산지: <input type="text" name="productOrigin" required></label><br>
        <label>용량: <input type="number" name="productVolume" required></label><br>
        <label>연령: <input type="number" name="productAge" required></label><br>
        <label>브랜드: <input type="text" name="productBrand" required></label><br>
        <label>이미지 경로: <input type="file" name="productImg" required></label><br>
        <label>카테고리명: <input type="text" name="categoryName" required></label><br>
        <label>회원 ID: <input type="text" name="memberId" required></label><br>
        <button type="submit">등록</button> -->
</section>
<script >
	
	
	
	
	$("#productInsertButton").click(function(){
        $("#insertContainer").toggle(); // 클릭 시 폼 컨테이너 표시/숨김 전환
    });
	</script>
</body>
</html>