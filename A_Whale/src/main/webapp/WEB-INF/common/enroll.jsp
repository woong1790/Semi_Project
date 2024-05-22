<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
   <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form action="/common/enroll.do" method="POST" onsubmit="return enroll_validate();">
            <div class="form-group">
                <label for="userid">사용할 아이디:</label>
                <input type="text" id="userid" name="userid" required>
                <input type="button" value="중복확인" onclick="checkId();" >
            </div>
            <div class="form-group">
                <label for="username">사용할 아이디:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="usernickname">사용할 닉네임:</label>
                <input type="text" id="usernickname" name="usernickname" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" placeholder="4글자 이상 입력" required>
            </div>
            <div class="form-group">
                <label for="confirm_password">비밀번호 확인:</label>
                <input type="password" id="confirm_password" name="confirm_password" required>
                <span id="ckresult"></span>
            </div>
            <div class="form-group">
                <label for="phone">전화번호:</label>
                <input type="tel" id="phone" name="phone" placeholder="(-없이)입력" required>
            </div>
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="address">주소<button style="width: 100px; height: 30px;">주소찾기</button></label>
                <input type="text" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="birthdate">생년월일:</label>
                <input type="date" id="birthdate" name="birthdate" required>
            </div>
            <div class="form-group">
                <label for="age_verification">연령 확인:</label>
                <select id="age_verification" name="age_verification" required>
                    <option value="">선택하세요</option>
                    <option value="over_19">19세 이상</option>
                    <option value="under_19">19세 미만</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit">가입하기</button>
            </div>
        </form>
    </div>
    <script>
    
    document.getElementById("confirm_password").addEventListener("keyup",
			e=>{
				const pw=document.querySelector("#password").value;
				const pwck=e.target.value;
				const resultContainer=document.querySelector("#ckresult");
				if(pw.length>=4&&pwck.length>=4){
    				if(pw==pwck){
    					resultContainer.innerText="비밀번호가 일치합니다";
    					resultContainer.style.color="green";
    				}else{
    					resultContainer.innerText="비밀번호가 일치하지 않습니다";
    					resultContainer.style.color="red";
    					document.querySelector("#password").value="";
    					e.target.value="";
    					document.querySelector("#password").focus();
    				}
				}else{
					resultContainer.innerText="";
				}
			});
    
    const enroll_validate=(e)=>{
		const userId=$("#userid").val().trim();
		if(userId.length<4){
			alert('아이디는 4글자 이상 작성해야합니다.');
			return false;
		}
		const password=$("#passsword").val().trim();
			if(password.length<4){
				alert("패드워드는 4글자이상 작성해야 합니다.")
		    	return false;
		    }
		}
    const checkId=e=>{
		const userId=$("#userid").val().trim();
		if(userId.length>=4){
			open("<%=request.getContextPath()%>/member/idduplicate.do?userId="+userId,
					"_blank","width=300,height=200");
		}else{
			alert("아이디를 4글자 이상 입력하세요");
		}
	}
    </script>
</body>
</html>