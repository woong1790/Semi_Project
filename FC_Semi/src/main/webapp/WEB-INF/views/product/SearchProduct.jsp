<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.nbp.product.model.DTO.Product" %>
<%
	List<Product> products=(List<Product>)request.getAttribute("searchProduct");
	String title2=(String)request.getAttribute("title2");
	String subtitle2=(String)request.getAttribute("subtitle2");
%>

				<div id="product-all" >
		        	<%for(Product p : products){%>
		        	<div id="product-result" class="product">
		        	<div id="productNo" style="display:none"><%=p.getProductNo() %></div>
		        	<div class="product-info" style="overflow:hidden"><a href="#"><img src="<%=request.getContextPath()%>/upload/productList/<%=p.getProductImg()%>" style="width:400px; height:420px; "></a></div>
		        	<div><p id="product-name"><%=p.getProductName()%></p></div>
		        	<div><p id="product-price"><%=String.format("%,d",p.getProductPrice())%>won</p></div>
		        	</div>
		        	<%
		        	}%>
		        </div>
		        
		    
		      
		      
		  