<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/subHeader.jsp" %>
<%@ page import="java.util.List, com.nbp.product.model.DTO.Product" %>
<% 
List<Product> products1=(List<Product>)request.getAttribute("products1");
%>

 <!-- 서브 카테고리에서 사용할 title,subtitle을 쿠키에 저장 >> 받아오는 로직 -->





  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    header{
        height: 150px;
    }
	#list-menu{
	   margin-top: 30px;
	   height: 150px;
	   display: flex;
	   justify-content: center;
	   align-items: center;
	}

    ul, li {
      margin: 0;
      padding: 0;
      list-style: none;
    }
    
    #list-menu>ul>li{
        margin: 0px 30px;
    }

    #list-menu>ul{
        display: flex;
        justify-content: center;
    }

    #list-menu>ul>li>ul{
        display: flex;
        align-items: center;
    }

    .sub-menu1{
      position: absolute;
      margin-top: 55px;
      font-size: 20px;
      font-family:KoPubWorldDotum;
      font-weight: lighter;
      cursor:pointer;
      opacity: 0;
      visibility: hidden;
      transition: all 0.35s ease-in;
      background-color: rgba(255, 255, 255, 0);
      border-radius: 5px;
    }

    .sub-menu1>li>p{
      color: #181850;
      margin-left:15px;
      margin-right:15px;
    }


    #sub-menu-title{
      display: flex;
      justify-content: center;
      font-size: 25px;
      font-weight: bolder;
      color: #181850;
	  cursor:default;
      padding-bottom:5px;
      transition: all 0.15s ease-in;

    }

    #sub-menu-title:hover .sub-menu1{
      opacity: 1;
      visibility: visible;
    }
    
    #sub-menu-title:hover{
    border-radius:100px;
      outline:6px solid #181850;
    }
    
    .sub-menu1>li>p:hover{
      font-weight:bolder;
    }

    #sub-menu-title>p{
    margin-left: 30px;
    margin-right: 30px;
    color: #181850;

    }
    
    #product-title{
    background-image: url("https://i.imgur.com/xgGLUIz.jpeg");
    background-size: 100%;
    padding-top:120px;
    padding-bottom:20px;
	height:180px;
    font-size:25px;
    width:100%;
    color:white;
    }
    
    #product-container{
		display:flex;
		justify-content:center;
    	align-items:center;
    	flex-direction: column;
    }
    
    #product-all{
    	display:grid;
    	justify-content:center;
    	align-items:center;
    	grid-template-columns: repeat(3,280px);
    	grid-template-rows: repeat(1,580px);
    	gap:90px;
    	/* border:1px solid red; */
    	min-width: 1400px; 
    	margin-top:80px;
    	margin-bottom:20px;

    	
    }
    
    #product-result>div>a{
    transition: all 0.25s ease-in;
    }
    
    #product-result>div>a:hover{
    	opacity:0.7;
    }
    
    .product{
    	width:270px;
    	height:360px;
    	/* border:1px solid red; */
    	
    }
    
    .read-btn{
    	width:170px;
    	height:50px;
    	background-color:rgb(17, 17, 68);
    	border-radius:100px;
    	display:flex;
    	justify-content:center;
    	align-items:center;
    	margin-top:180px;
    	margin-bottom:100px;
    	cursor:pointer;
    	outline:4px solid lightgray;
    }
    
    .read-btn>p{
    	text-decoration:none;
    	color:white;
    	font-size:22px; 
    	font-weight:bolder;
    	padding-bottom:2px;

    }
    
    .read-btn:hover{
    	opacity:0.7;
    }
    
    #product-name{
		font-size:30px;
		color:black;
		font-weight:bolder;
		text-align:center;
    }
    
    #product-price{
    	font-size:25px;
    	text-align:center;

    }
    
    #sub-menu-title>p>span{
    display:none;
    }
    
    #product-result>div{

    }
    
</style>
</head>
<body>
<section>
		<div id="product-title"  style="min-width: 1400px; margin-right:60px"> <br><br>
			<h2 style="text-align:center;">All Products.</h2>
			<p style="font-size:17px; text-align:center; margin-top:3px; color:white;">"Find your perfect moment of relaxation with A.Whale."</p>
		</div>
        <div id="list-menu" style="min-width: 1400px;">
            <ul>
                <li id="sub-menu-title"><p>brand<span>,PRODUCT_BRAND</span></p>
                    <ul class="sub-menu1">
                        <li><p>발렌타인</p></li>
                        <li><p>글렌피틱</p></li>
                        <li><p>로얄살루트</p></li>
                        <li><p>조니워커</p></li>
                        <li><p>딤플</p></li>
                        <li><p>임페리얼</p></li>
                    </ul>
                </li>
                <li id="sub-menu-title"><p>alcohol<span>,PRODUCT_ALCOHOL_LV</span></p>
                    <ul class="sub-menu1">
                      <li><p>-20</p></li>
                      <li><p>20-30</p></li>
                      <li><p>30-40</p></li>
                      <li><p>40-50</p></li>
                      <li><p>50-60</p></li>
                    </ul>
                </li>
                <li id="sub-menu-title" ><p>origin<span>,PRODUCT_ORIGIN</span></p>
                    <ul class="sub-menu1">
                      <li><p>스코틀랜드</p></li>
                      <li><p>영국</p></li>
                      <li><p>미국</p></li>
                      <li><p>캐나다</p></li>
                      <li><p>독일</p></li>
                    </ul>
                </li>
                <li id="sub-menu-title" ><p>age<span>,PRODUCT_AGE</span></p>
                    <ul class="sub-menu1">
                      <li><p>~10</p></li>
                      <li><p>10~15</p></li>
                      <li><p>15~20</p></li>
                      <li><p>20~25</p></li>
                      <li><p>25~30</p></li>
                    </ul>
                </li>
                <li id="sub-menu-title" ><p>type<span>,CATEGORY_NAME</span></p>
                  <ul class="sub-menu1">
                    <li><p>위스키</p></li>
                    <li><p>와인</p></li>
                    <li><p>증류주</p></li>
                    <li><p>보드카</p></li>
                  </ul>
              </li>
                
            </ul>
        </div>
        <div id="main-container" style="display:flex; flex-direction:column; align-items:center; justify-content:center;">
	        <div id="product-container">
		        <div id="product-all" >
		        	<%for(Product p : products1){%>
		        	<div id="product-result" class="product">
		        	<div class="product-info" style="overflow:hidden"><a href="#"><img src="<%=p.getProductImg()%>" style="width:400px; height:420px; "></a></div>
		        	<div><p id="product-name"><%=p.getProductName()%></p></div>
		        	<div><p id="product-price">$<%=p.getProductPrice()%></p></div>
		        	</div>
		        	<%
		        	}%>
		        </div>
		        
	        </div>
	        <div id="pageBar"><%=request.getAttribute("pageBar")%></div>
	   </div>
	        
        <script>
        
        /* 전체 제품 리스트 더보기 페이징 구현 */ 
       let firstNo=1;
        $("#all-read-btn").click(e=>{
        	firstNo=firstNo+6;
        	$.get("<%=request.getContextPath()%>/product/productlist.do?firstNo="+firstNo)
        	.done(data=>{
        		console.log(data);
        		if(data.includes("TEST")==false){
        			alert("더이상 제품이 없습니다.");
        			$("#all-read-btn").css('display','none');
        		}else{
        			document.getElementById("product-container").innerHTML+=data;
        			console.log(data.includes("TEST"));
        		}
        	});
        });
        
        
        
        /* 서브 카테고리 클릭 시 해당 카테고리에 있는 상품 조회 */
        $(".sub-menu1>li>p").click(e=>{
        	let mainResult=$(e.target).parent().parent();
        	/* 서브 카테고리 명 출력 >> mainResultText[1] */
        	let mainResultText=mainResult.prev().text().split(",");
   			/* 서브 카테고리 밑 세부 카테고리 명 출력 */
        	let result = $(e.target).text();
   			
   			$("#all-read-btn").css('display','none'); 
   			
   			searchfirstNo=1;
   			
   			$.get("<%=request.getContextPath()%>/product/searchproduct.do?title="+mainResultText[1]+"&subtitle="+result)
   				.done(data=>{
   					/* console.log(data); */
   					document.getElementById("product-container").innerHTML=data;
   					document.getElementById("pageBar").innerHTML="<div id='search-read-btn' class='read-btn' style='bolder:1px solid red'><p>read-More</p></div>";
   				});      	
        });

        
        
        /* 소분류 제품 조회 리스트 더보기 페이징 구현 */
       let searchfirstNo=1;
        /* 자바스크립트에서 쿠키 가져오는 함수 */
       function getCookie(name) {
    	    const cookieString = document.cookie;
    	    
    	    const cookies = cookieString.split(';');
    	    
    	    for (let i = 0; i < cookies.length; i++) {
    	        let cookie = cookies[i].trim();
    	        
    	        if (cookie.startsWith(name + '=')) {
    	            return cookie.substring((name + '=').length, cookie.length);
    	        }
    	    }
    	    return null;
    	}
        
		/* 서브 카테고리 >> read -more 버튼 구현 */
       		$(document).on('click', '#search-read-btn', function() {
	        	title=getCookie('title');
	        	subtitle=getCookie('subtitle');
	   			console.log(title);
	   			console.log(subtitle);
	   			searchfirstNo=searchfirstNo+6;
	        	$.get("<%=request.getContextPath()%>/product/searchproductlist.do?searchfirstNo="+searchfirstNo+"&title="+title+"&subtitle="+subtitle)
	        	.done(data=>{
	        		if(data.includes("TEST")==false){
	        			alert("더이상 제품이 없습니다.");
	        			$("#search-read-btn").css('display','none');
	        		}else{
	        			document.getElementById("product-container").innerHTML+=data;
	        			console.log(data.includes("TEST"));
	        		}
        		});
		  	});
		
		
		/* 제품 클릭시 상세페이지로 이동 */
		$(".product-info").click(e=>{
			const productName = $(e.target).closest('.product').find('#product-name').text());
			location.assign("<%=request.getContextPath()%>/product/productInfo.do?productName="+productName);
		});
		
	       
			
			
		
        </script>

    </section>

</body>
</html>