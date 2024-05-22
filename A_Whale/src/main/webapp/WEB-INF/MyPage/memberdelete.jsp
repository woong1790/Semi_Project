<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
    
    <%@ page import="com.nbp.model.DTO.Member" %> 
    <%@ page import="com.nbp.model.DAO.MemberDAO" %>   
    

<%
   Member loginMember=(Member)session.getAttribute("loginMember");
%>

<!DOCTYPE html>
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
<link href="https://webfontworld.github.io/kopus/KoPubWorldDotum.css" rel="stylesheet">

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


<body>
	<style>
        body {
            font-family: KoPubWorldDotum;
           	
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        .container h1 {
            margin-bottom: 20px;
        }
        .container p {
            margin-bottom: 20px;
        }
        .container input[type="password"],
        .container select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .container button {
            padding: 10px 20px;
            background-color: #d9534f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .container button.cancel {
            background-color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원 탈퇴</h1>
        <p>정말로 회원 탈퇴를 하시겠습니까? 본인 확인을 위해 비밀번호를 입력해주세요.</p>
        <form action="<%=request.getContextPath() %>/MyPage/deleteMember.do" method="POST">
            <input type="password" name="password" placeholder="비밀번호 입력" required>
            <select name="reason" required>
                <option value="" disabled selected>탈퇴 사유를 선택해주세요</option>
                <option value="서비스 불만족">서비스 불만족</option>
                <option value="사용 빈도 낮음">사용 빈도 낮음</option>
                <option value="다른 서비스 이용">다른 서비스 이용</option>
                <option value="개인정보 우려">개인정보 우려</option>
                <option value="비용 문제">비용 문제</option>
                <option value="기타">기타</option>
            </select>
            <button type="submit">탈퇴</button>
            <button type="button" class="cancel">취소</button>
        </form>
    </div>
</body>
</html>