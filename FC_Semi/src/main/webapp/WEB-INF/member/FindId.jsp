<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String email=(String)request.getAttribute("memberId");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <style>
        body {
            font-family: 'KoPubWorldDotum', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }
        .container {
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            width: 400px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .container input[type="email"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .container button {
            padding: 10px 20px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .container button:hover {
            background-color: #45a049;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>아이디 찾기</h2>
        <form id="findIdForm">
            <label for="email">회원가입할 때 입력했던 이메일주소:</label>
            <input type="email" id="findemail" name="findemail" required>
            <button type="submit">전송</button>
        </form>
        <form id="findIdForm2">
        <div id="verificationSection" style="display:none;">
            <label for="verificationCode">인증번호 입력:</label>
            <input type="text" id="verificationCode" name="verificationCode" required>
            <button type="submit" id="verifyButton">인증</button>
        </div>
       <div id="result"></div>
       </form>
    </div>

    <script>
    	let verificationCode = '';
    	
        document.getElementById("findIdForm").addEventListener("submit", function (event) {
            event.preventDefault();
            const findemail = document.getElementById("findemail").value;
           
            console.log(findemail);
            if (findemail && findemail.trim() !== "") {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/common/emailSend.do", // 서블릿 URL
                        method: "POST",
                        data: { findemail: findemail },
                        success: function(response) {
                        	verificationCode=response;
                            // 서버로부터 받은 응답 처리
                       //   $('#result').html(response); // 결과를 페이지에 표시
                			    	     
                       // 입력 필드를 읽기 전용으로 설정
                            $('#findemail').prop('readonly', true);
                            // 인증번호 입력 섹션을 표시
                            $('#verificationSection').show();
                        },
                        error: function() {
                            alert('이메일 전송에 실패했습니다.');
                        }
                    }); 
            } else {
                alert("이메일 주소를 입력해 주세요.");
            }
        });
        document.getElementById("findIdForm2").addEventListener("submit", function (event) {
            event.preventDefault();
        const inputCode = document.getElementById("verificationCode").value;
        const findemail = document.getElementById("findemail").value;
        if(inputCode===verificationCode){
			$.ajax({
           		url: "<%=request.getContextPath()%>/common/IDFinder.do",
           		method: "POST",
           		data: {findemail: findemail},
           		success: function(response){
           			$("#result").html("아이디 "+response+" 으로 가입!");
           			},
           			error: function(){
           				$("#result").html("해당 이메일로 가입된 아이디가 없습니다.");
           			}
           		});
        	}else{
        		alert("인증번호가 일치하지 않습니다.");
        	}
           	});
			   
    </script>
</body>
</html>