<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
<link href="https://webfontworld.github.io/kopus/KoPubWorldBatang.css" rel="stylesheet">
</head>
<body>
<style>
    #menubar>ul>li{
        list-style: none;
        text-decoration-line: none;
        margin-bottom: 15px;
        /* border: 1px solid red; */
        width: 150px;
    }
    #mypage{
        /* border: 1px solid red; */
        display: flex;
        justify-content: center;
    }#content{
        display: inline-block;
        /* border: 1px solid red; */
    }
    #menubar{
        width: 150px;
    }
    .aside{
       /* border: 1px dotted blue; */
       border: 1px solid black;
       width: 15%;
       height: 800px;
       display: flex;
       flex-direction: column;
       justify-content: center;
       align-items: center;
       justify-content: space-evenly;
            
        }
        .aside>nav>ul{
            height: 650px;
            list-style-type:none ;
            margin: 0;
            padding: 0;
            
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
        }
        .aside>nav>ul>li{
            
            /* font-family: "휴먼굴림둥근체"; */
            font-weight: bolder;
            font-size: 30px;
            margin-top: 0;
            
        }
        .aside>nav>ul>li a{
            
            /* font-family: "휴먼굴림둥근체"; */
            font-weight: bolder;
            font-size: 20px;
            margin-top: 0;
            
        }
        .article{
            /* border: 1px dotted blue; */
            border: 1px solid black;
            width: 85%;
            height: 800px;
            display: flex;
            flex-wrap: wrap;
            margin: 0;
        }
        .section{
            display: flex;
            margin-top: 50px;

        }
        .aside a{
            list-style: none;
        text-decoration-line: none;
        font-size: 13px;
        }
       #top{
            display: flex;
            justify-content: center;
        }
        body {
        font-family: "Nanum Pen Script", cursive;
        font-weight: 400;
        font-style: normal;
        background-image: url(https://images.unsplash.com/photo-1629196911514-cfd8d628ba26?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
        }
        body * {
        font-family: "Nanum Pen Script", cursive;
        font-weight: 400;
        font-style: normal;
        }
</style>
</body>
</html>