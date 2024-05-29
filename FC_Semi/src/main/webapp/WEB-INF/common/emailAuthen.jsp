<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String inputEmail=(String)request.getAttribute("inputEmail");
    	String AuthNum=(String)request.getAttribute("AuthNum");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:disabled {
            background-color: #ccc;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>이메일 인증</h2>

        <form id="signupForm">
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="Uemail" name="Uemail" value="<%=inputEmail %>" readOnly>
            </div>
            <div class="form-group">
                <button type="button" id="sendVerificationBtn">인증번호 전송</button>
            </div>
            <div class="form-group" id="verificationCodeGroup" >
                <label for="verificationCode">인증번호:</label>
                <input type="text" id="verificationCode" name="verificationCode" required>
                <button type="button" id="verifyCodeBtn">인증번호 제출</button>
            </div>
        </form>
    </div>

      <script type="text/javascript">
    //여기서 에이작스 써서 서블릿으로 보내기~
    let email=$("#Uemail").val();
      $("#sendVerificationBtn").click(e=>{
    	  $.get("<%=request.getContextPath()%>/common/emailSend.do?useremail="+email)
    	  .done(data=>{
    		  alert("인증번호가 전송됐습니다.");
    		  console.log(data);
    		  console.log($("#verificationCode").val());
    		  $("#verifyCodeBtn").click(e=>{
    			  if($("#verificationCode").val()==data){
        			  alert("인증 성공하였습니다.");
        			  window.close();
        			  opener.document.getElementById("email").setAttribute("readOnly",true);
        		  }else{
        			  $("#verificationCode").html("이메일 인증에 실패했습니다.");
        		  }  
    		  })
    	  });
    	  
    	  });
    </script>
</body>
</html>