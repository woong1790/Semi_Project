<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String kakaoEmail=(String)request.getAttribute("kakaoEmail");
	String kakaoNickname=(String)request.getAttribute("kakaoNickname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
            width: 330px;
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
        <form action="<%=request.getContextPath() %>/common/enroll.do" method="POST" onsubmit="return enroll_validate();">
            <div class="form-group">
                <label for="userid">사용할 아이디:</label>
                <input type="text" id="userid" name="userid" placeholder="아이디는 숫자와 영어소문자만 입력 가능합니다." required>
                <input type="button" value="중복확인" onclick="checkId();" >
            </div>
            <div class="form-group">
                <label for="username">이름:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="usernickname">사용할 닉네임:</label>
                <%if(kakaoNickname==null) {%>
                	<input type="text" id="usernickname" name="usernickname" required>
               	 <%}else if(kakaoNickname!=null) {%>
               	 	<input type="text" id="usernickname" name="usernickname" value="<%=kakaoNickname %>" required>
                <%} %>
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
                <label for="email">이메일:</label><button id="emailAuthen">이메일 인증</button>
                <%if(kakaoEmail==null) {%>
                	<input type="email" id="email" name="email" required>
              	  <%}else if(kakaoEmail!=null) {%>
                		<input type="email" id="email" name="email" value="<%=kakaoEmail %>" required>
                <%} %>
            </div>
            <div class="form-group">
                <input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode();" value="우편번호 찾기"><br>
				<input type="text" id="sample6_address" name="sample6_address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" name="sample6_extraAddress" placeholder="참고항목">
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
                <button type="submit" onclick="check">가입하기</button>
            </div>
        </form>
    </div>
    <script>
    	document.getElementById("emailAuthen").addEventListener("click",e=>{
    		let userEmail=$("#email").val().trim();
    		window.open("<%=request.getContextPath()%>/common/emailAuthen.do?userEmail="+userEmail,"_blank","width=420,height=500");
    	});
    	
    	document.getElementById("age_verification").addEventListener("change", e => {
    		if (e.target.value === "under_19") {
                if (confirm("19세 미만은 가입할 수 없습니다. 메인 페이지로 이동하시겠습니까?")) {
                    window.location.href = "<%=request.getContextPath()%>";
                } else {
                    document.getElementById("userid").value = "";
                }
            }
        });
    </script>
    <script>
    
    const check=()=>{
    	console.log(document.getElementById("sample6_detailAddress").value());
    }
    
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
		};
    const checkId=e=>{
		const userId=$("#userid").val().trim();
		if(userId.length>=4){
			open("<%=request.getContextPath()%>/idduplicate.do?userId="+userId,
					"_blank","width=300,height=200");
		}else{
			alert("아이디를 4글자 이상 입력하세요");
		}
	};
	document.getElementById("userid").addEventListener("input", e => {
        e.target.value = e.target.value.replace(/[^a-z0-9]/g, '');
    });
    </script>
    
    <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>