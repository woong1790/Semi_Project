<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
추가 후 삭제하시겠습니까?
<button onclick="wishtobasketyesdelete();"> 네 </button>
<button onclick="wishtobasketnodelete();">아니오 </button>
<script>
	const wishtobasketyesdelete=()=>{
		let result="<%=request.getAttribute("baskets")%>";
		location.assign('<%=request.getContextPath()%>/wishlist/insertbasketdelete.do?baskets='+result);
	
	}

	 const wishtobasketnodelete=()=>{
		console.log("sss");
		let result="<%=request.getAttribute("baskets")%>";
		location.assign('<%=request.getContextPath()%>/wishlist/insertbaskets.do?baskets='+result);
	
	 }
</script>
</body>
</html>