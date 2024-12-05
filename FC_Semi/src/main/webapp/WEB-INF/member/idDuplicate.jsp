<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean result=(Boolean)request.getAttribute("result");
	String paramId=request.getParameter("userId");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<style>
	div#checkId-container{
		text-align:center;
		padding-top:50px;
	}
	span#duplicated{
		color:red;
		font-weight:bolder;
	}
</style>
</head>
<body>
<div id="checkId-container">
	<%if(result){ %>
		[<span><%=paramId %></span>]는 사용가능합니다.	
		<br><br>
		<button type="button" onclick="window.close()" >닫기</button>
	<%}else{ %>
		[<span id="duplicated"><%=paramId %></span>]는 사용중입니다.
		<br><br>
		<!-- 아이디 재입력창 구성 -->
		<form action="<%=request.getContextPath()%>/idduplicate.do" 
		method="post">
			<input type="text" name="userId" id="userId_">
			<input type="submit" value="중복검사" >
		</form>
	<%} %>
	<script>
		document.querySelector("button").addEventListener("click",
				e=>{
					const $userId=opener.document.querySelector("#userid");
					$userId.value="<%=paramId%>";
					$userId.readOnly=true;
					$userId.style.backgroundColor="lightgray";
					window.close();
				});
	</script>
</div>
</body>
</html>