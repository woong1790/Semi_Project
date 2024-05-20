
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nbp.model.DTO.Member" %>    
<%
	Member loginMember=(Member)session.getAttribute("loginMember");
	//Cookie값 가져오기
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
%>
	
	
<%@ include file="/WEB-INF/style/mainPage.css" %> 
<%@ include file="/WEB-INF/style/header.css" %> 
<!DOCTYPE html>
<html>
<header>
    <div id="headmain" style="min-width: 1000px;">
        <div id="logo">
            <div class="logo border" style="width: 300px; height: 120px;">
                <div><h3 style="margin-left: 30px; margin-top: 20px; font-family: KoPubWorldBatang;">Experience a new flavor! <br><br> Our spirits offer a journey of pure delight.</h3></div>
            </div>
            <div class="logo border" style="width: 600px; height: 120px;"><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfNjcg/MDAxNzE1ODUwMjgwOTY5.Jv6Kv_HtWZpWqwM47oHMsFPkdaNbnGuLxQcWEOivE3og.C6hmrMJVaBa-vZpvbdWJ47MpvixWDoZYUjALOHNn1ssg.PNG/logo1.png?type=w773" alt="" width="150px" height="110px"></div>
            <div  class="logo evencenter" style="width: 300px; height: 120px; "> 
                <a href="" class="header-icon"><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfMjU4/MDAxNzE1ODUwMjgwOTU4.Tk8o-0wr5yOJqHcZe2qSyd6Sw5htuKotfTvqpzw3ffsg.m5BvckFSblkDLbIXmjnPS2PwN5ajZOzkXWxbG2S4fkgg.PNG/cart.png?type=w773" width="50px" height="50px"></a>
                <a href="" class="header-icon"><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfMTY0/MDAxNzE1ODUwMjgwOTU2.uF-0pUqfz5kh9OZ-pV5bnC3W0BfZl04LzzoOjbKmAiUg.fn20oNtHI4PZjHPE9-DQ54fmBRjZ7gEQVfdQRCjDn8Eg.PNG/heart.png?type=w773" width="50px" height="50px"></a>
                <a id="mypage" href="<%=request.getContextPath() %>/member/MyPage.do" class="header-icon"><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfNCAg/MDAxNzE1ODUwMjgxMDgw.TxIrC-5XuT4c-JczAuIocVq_gKcq-TIyIwjUNXLJbIwg.FAvOJXG7cNFKR2QCVGGy8eRzhOJLcAndZXbysBJl1YMg.PNG/person.png?type=w773" width="50px" height="50px"></a>
            </div>
        </div>
        <div id="category" style="min-width: 1000px;margin-top: 20px;">
          <nav role="navigation">
            <ul id="main-menu">
              <li><a href="#" id="menu">home</a>
                <ul id="sub-menu">
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                </ul>
              </li>
              <li><a href="#" id="menu">product</a>
                <ul id="sub-menu">
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                </ul>
              </li>
              <li><a href="#" id="menu">event</a>
                <ul id="sub-menu">
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                </ul>
              </li>
              <li><a href="#" id="menu" >recipe</a>
                <ul id="sub-menu">
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                </ul>
              </li>
              <li><a href="#" id="menu">community</a>
                <ul id="sub-menu">
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                </ul>
              </li>
              <li><a href="#" id="menu">sercvice</a>
                <ul id="sub-menu">
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                  <li><a href="#" aria-label="subemnu">submenu</a></li>
                </ul>
              </li>
            </ul>
          </nav>
        </div>    
</header>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css"
	rel="stylesheet">
<link href="https://webfontworld.github.io/kopus/KoPubWorldBatang.css"
	rel="stylesheet">
<link href="./src/main/webapp/WEB-INF/style/mainPage.css" rel="stylesheet" type="text/css">

<title>A-Whale</title>
</head>
<body>
	<div class="menu1">
		<img
			src="https://i.pinimg.com/564x/d0/aa/aa/d0aaaa675b2aa1158492d4e698b28655.jpg"
			alt="동그라미~"> <img class="lettering" src="./image/awhale.png"
			alt="레터링">

	</div>
	<div class="menu2">
		<div class="menu2-1">
			<a style="text-decoration-line: none;" href="">A-Whale</a> <a
				style="text-decoration-line: none;" href="">A-Whale</a> <a
				style="text-decoration-line: none;" href="">A-Whale</a>
		</div>
	</div>
	<div class="menu3">
		<a href="">A-Whale</a>
	</div>
	<div class="menu4">
		<div class="left">
			<div class="left-child">
				<img style="width: 100%; height: 100%;"
					src="http://www.koreanewstoday.co.kr/news/photo/202203/66962_46979_3934.jpg"
					alt="zz">
				<!-- div안에 넣기전에 div에 overflow: hidden 주고 이미지에 height,width 각 100%씩 -->
			</div>
			<div class="left-child">
				<img
					style="width: 100%; height: 100%; margin-top: 5px; border-radius: 10px;"
					src="https://dimg.donga.com/ugc/CDB/WEEKLY/Article/5d/bb/ba/e1/5dbbbae119c7d2738de6.jpg"
					alt="">
			</div>
		</div>
		<div class="center imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://contents.sixshop.com/thumbnails/uploadedFiles/135637/default/image_1674201956171_1000.jpg"
				alt="zz">
		</div>
		<div class="right imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://dewberry9.github.io/assets/images/daily/bombay-sapphire/04.jpg"
				alt="zz">
		</div>
	</div>
	<div class="menu5">
		<div class="left2 imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://images.khan.co.kr/article/2024/01/25/news-p.v1.20240125.3f5fc2c0c3724e8995fb7a365b3c77a7_P1.jpeg"
				alt="zz">
		</div>
		<div class="center2 imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://www.esquirekorea.co.kr/resources_old/online/org_online_image/eq/3e274de4-1b3a-4f88-825f-d47f690c8945.jpg"
				alt="zz">
		</div>
		<div class="right2 imagehidden">
			<img style="width: 100%; height: 100%;"
				src="https://ae01.alicdn.com/kf/Sf2b708307afb4923af70ea64bbcc2bd7y.jpg_640x640Q90.jpg_.webp"
				alt="zz">
		</div>
	</div>
	<div class="menu6">
		<div class="left3">
			<div class="child imagehidden">
				<img style="width: 100%; height: 100%;"
					src="https://cdn.woodkorea.co.kr/news/photo/202212/71473_81562_4716.jpg"
					alt="zz">
			</div>
			<div class="child imagehidden">
				<p>여기는 주류 설명~</p>
				<!-- <img style="width: 100%; height: 100%;" src="https://i.pinimg.com/736x/9a/e5/f2/9ae5f2aed5284649c009b7bea3f0b345.jpg" alt="zz"> -->
			</div>
		</div>
		<div class="center3">
			<div class="child imagehidden">
				<img style="width: 100%; height: 100%;"
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvcW7zlXmfJqdyvKnT0WPQVrjk_pyQjN0zL4eBIPiZDw&s"
					alt="zz">
			</div>
			<div class="child imagehidden">
				<p>여기는 주류 설명~</p>
				<!-- <img style="width: 100%; height: 100%;" src="https://i.pinimg.com/736x/9a/e5/f2/9ae5f2aed5284649c009b7bea3f0b345.jpg" alt="zz"> -->
			</div>
		</div>
		<div class="right3">
			<div class="child imagehidden">
				<img style="width: 100%; height: 100%;"
					src="https://biz.chosun.com/resizer/Tpbb-q42I_IhhcNHabeY6DP8Xs0=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/AZA5NM7DWVF55MR4NCV2S6GPGE.jpg"
					alt="zz">
			</div>
			<div class="child imagehidden">
				<p>여기는 주류 설명~</p>
				<!-- <img style="width: 100%; height: 100%;" src="https://i.pinimg.com/736x/9a/e5/f2/9ae5f2aed5284649c009b7bea3f0b345.jpg" alt="zz"> -->
			</div>
		</div>
	</div>
	<div class="menu7"></div>
	 <!-- 아이디 입력 박스 -->
    <div id="login">
      <div id="login-close" style="width: 40px; height: 40px;"><img src="https://i.imgur.com/B3yWAxM.png" width="25px"></div>
      <div style="border: 1px solid red;">
        <!-- 아이디 -->
        <div id="inputs01" class="inputs" style="display: flex; justify-content:center; align-items:center; width:350px; height: 55px;">
          <img src="https://i.imgur.com/jiAGWQk.png" width="20px" style="margin-left: 20px;margin-right: 10px;">
          <label for="id_input01">
            <input type="text" id="id_input01" placeholder="아이디">
          </label>
        </div>
        <br>
        <!-- 비밀번호 -->
        <div id="inputs02" class="inputs" style="display: flex; justify-content:center; align-items:center; width:350px; height: 55px;">
          <img src="https://i.imgur.com/sPvVjJ2.png" width="20px" style="margin-left: 20px; margin-right: 10px;">
          <label for="id_input02">
            <input type="password" id="id_input02" placeholder="비밀번호">
          </label>
        </div>
        
        <!-- 아이디 저장 체크박스 -->
        <div style="margin-top: 20px;">
            <input type="checkbox">아이디 저장
            <!-- 로그인 버튼 -->
            <br>
            <button>로그인</button>
        </div>
        <!-- 비밀번호 찾기, 아이디 찾기, 회원가입 버튼 -->
        <div id="find" style="margin-top: 20px;">
          <a href="#">비밀번호 찾기</a>
          <a href="#">아이디 찾기</a>
          <a href="#" style="border-right:0px">회원가입</a>
        </div>
      </div>
    </div>
    </div>

  <script>
    // 로그인 창 띄우기
    document.getElementById("mypage").addEventListener("click",e=>{
      const login = document.getElementById("login");
      if(login.style.display="none"){
        login.style.display="block";
      }
    });

    //로그인 창 닫기
    document.getElementById("login-close").addEventListener("click",e=>{
      const login = document.getElementById("login");
      if(login.style.display="block"){
        login.style.display="none";
      }
    });

    document.querySelector("#id_input01").addEventListener("focus",e=>{
      const div01=document.getElementById("inputs01");
      div01.style.opacity="1";
      div01.style.border="3px solid rgb(66, 114, 227)";
    });
    document.querySelector("#id_input01").addEventListener("blur",e=>{
      const div01=document.getElementById("inputs01");
      div01.style.opacity="0.5";
      div01.style.border="0px";
    });

    document.querySelector("#id_input02").addEventListener("focus",e=>{
      const div01=document.getElementById("inputs02");
      div01.style.opacity="1";
      div01.style.border="3px solid rgb(66, 114, 227)";
    });
    document.querySelector("#id_input02").addEventListener("blur",e=>{
      const div01=document.getElementById("inputs02");
      div01.style.opacity="0.5";
      div01.style.border="0px";
    });

    
  </script>



</body>

</html>