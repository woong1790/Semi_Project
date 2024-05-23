<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
위시리스트에 추가 후 삭제하시겠습니까?
<button onclick="wishtobasketyesdelete();"> 네 </button>
<button onclick="wishtobasketnodelete();">아니오 </button>
<script>
	const wishtobasketyesdelete=()=>{
		let result="<%=request.getAttribute("insertCartArr")%>";
		let result2="<%=request.getAttribute("insertProductArr")%>"
		location.assign('<%=request.getContextPath()%>/shoppingbasket/baskettowishdelete.do?insertCartArr='+result+'&insertProductArr='+result2);
	
	}

	 const wishtobasketnodelete=()=>{
		
		let result="<%=request.getAttribute("insertCartArr")%>";
		let result2="<%=request.getAttribute("insertProductArr")%>"
		location.assign('<%=request.getContextPath()%>/shoppingbasket/baskettowish.do?insertCartArr='+result+'&insertProductArr='+result2);
	
	 }
	 </script> 
</body>
</html>