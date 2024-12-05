<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="com.nbp.model.DTO.Member"%>
  <%@ page import="com.nbp.model.DAO.MemberDAO" %>
  <%@ page import="java.util.*,com.nbp.order.model.dto.MyPageOrder" %>
  <%@ page import="com.nbp.order.model.dao.OrderDAO,com.nbp.order.model.dto.MyPageOrder" %>
  <%
	  Member loginMember=(Member)session.getAttribute("loginMember");
		System.out.println(loginMember.getMemberId()+"MyOrderList.jsp");
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
	 /*  String orderer=request.getParameter("MemberId");
	  String loginId="";
	  try{
		  loginId=loginMember.getMemberId();
	  }catch(NullPointerException e){
		  loginId="";
	  } */
	  List<MyPageOrder> orderList=(List<MyPageOrder>)request.getAttribute("orderList");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: 'KoPubWorldDotum', sans-serif;
        background-color: #f0f0f0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        background-color: white;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        width: 80%;
        text-align: center;
    }
    h2 {
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ddd;
    }
    th {
        background-color: #f4f4f4;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
</style>
</head>
<body>

	<div class="container">
        <h2>주문내역조회</h2>
        <table>
            <thead>
                <tr>
                    <th>주문 번호</th>
                    <th>제품명+옵션명</th>
                    <th>주문 일자</th>
                    <th>주문 금액(수량)</th>
                    <th>주문 상태</th>
                </tr>
            </thead>
            <tbody id="orderList">
            	<%if(!orderList.isEmpty()){ 
            		for(MyPageOrder mpo:orderList){ %>
            			<tr>
                            <td><%= mpo.getOrderId() %></td>
                            <td><%= mpo.getProductName() %></td>
                            <td><%= mpo.getOrderDDay() %></td>
                            <td><%= mpo.getOrderTPrice() %></td>
                            <%if(mpo.getOrderCode()==1){ %>
                            <td>배송 진행중</td>
                            <%}else if(mpo.getOrderCode()==2){ %>
                            <td>취소 완료</td>
                            <%}else if(mpo.getOrderCode()==3){ %>
                            <td>환불 완료</td>
                            <%}else if(mpo.getOrderCode()==4){ %>
                            <td>배송 완료</td>
                            <%} %>
                        </tr>	
            	<%}%>
            	
            	<%}else{ %>
           			<tr>
                       <td colspan="5">주문 내역이 없습니다.</td>
                    </tr>
            	<%} %>
                <!-- 주문 내역이 여기 표시됩니다 -->
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
   

</body>
</html>