<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
<link href="https://webfontworld.github.io/kopus/KoPubWorldBatang.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<style>
        body{
          background-image: url("https://images.unsplash.com/photo-1629196911514-cfd8d628ba26?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
          background-size: 100%;

        }

        .shadow{
          box-shadow: 3px 3px 3px 3px #555555
        }

        #headmain{
            height: 220px;
        }

        #logo{
            height: 150px;
            /* border: 1px solid blue; */
            display: flex;
            justify-content: center;
            align-items: center;
            justify-content: space-between;
            
           
        }
        .logo{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #ctg{
            height: 180px;
            /* border: 1px solid red; */
        }
        .evencenter{
            justify-content: space-evenly;
        }

        a{text-decoration:none; font-size: 18px;}
        *{margin: 0;}


        .header-icon{
          opacity: 1;
          transition: all 0.25s ease-in;
        }

        .header-icon:hover{
          opacity: 0.5;
        }


    nav {
      width: 100%;
      display: flex;
      justify-content: center;
      position: relative;
    }

    ul, li {
      margin: 0;
      padding: 0;
      list-style: none;
    }

    #main-menu > li {
      float: left;
      position: relative;
      margin: 0px 40px;

    }

    #main-menu > li > a {
      font-size: 30px;
      color: rgb(57, 56, 68);
      font-weight: bolder;
      text-align: center;
      text-decoration: none;
      letter-spacing: 0.05em;
      display: block;
      padding: 14px 36px;
      text-shadow: 1px 1px 1px rgba(18, 14, 87, 0.5);

    }


    #sub-menu {
      position: absolute;
      margin-top: 20px;
      opacity: 0;
      visibility: hidden;
      transition: all 0.35s ease-in;
      background: #ffffff69;
      border-radius: 5px;
    }

    #sub-menu > li {
      padding: 16px 28px;

    }

    #sub-menu > li >  a {
      color: rgb(17, 4, 88);
      text-decoration: none;
      font-size: 25px;
    }

    #main-menu > li:hover #sub-menu {
      opacity: 1;
      visibility: visible;
    }



    #sub-menu > li >  a:hover {
    text-decoration: underline;
    }

        #main-menu {
      text-align: center;
    }

    #main-menu li {
      display: inline-block;
    }

    #main-menu a {
      display: inline-block; 
      opacity: 1;
      transition: all 0.35s ease-in;
    }

    #main-menu a:hover{
      opacity: 0.5;
    }
    </style>
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
                    <a href="" class="header-icon"><img src="https://postfiles.pstatic.net/MjAyNDA1MTZfNCAg/MDAxNzE1ODUwMjgxMDgw.TxIrC-5XuT4c-JczAuIocVq_gKcq-TIyIwjUNXLJbIwg.FAvOJXG7cNFKR2QCVGGy8eRzhOJLcAndZXbysBJl1YMg.PNG/person.png?type=w773" width="50px" height="50px"></a>
                </div>
            </div>
            <div id="category" style="min-width: 1000px;margin-top: 20px;">
              <nav role="navigation">
                <ul id="main-menu">
                  <li><a href="#" id="menu">HOME</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">PRODUCT</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">EVENT</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu" >RECIPE</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">COMMUNITY</a>
                    <ul id="sub-menu">
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                      <li><a href="#" aria-label="subemnu">submenu</a></li>
                    </ul>
                  </li>
                  <li><a href="#" id="menu">SERVICE</a>
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
            <script>


            </script>
            

            
           
    </header>
</body>
</html>