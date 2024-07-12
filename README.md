![](https://i.imgur.com/b9vMFbV.png)
# Semi_Project 주류 쇼핑몰[:첫차]
<img src="https://i.imgur.com/CkYnwtk.png" width="300" height="70"/> <img src="https://i.imgur.com/oNOerqY.png" width="300" height="70" align="right"/>

## 🧑‍🎓팀 구성
<p align="center"><img src="https://i.imgur.com/PgqJfVw.png" width="200" height="300"/><img src="https://i.imgur.com/81wj8LD.png" width="200" height="300"/><img src="https://i.imgur.com/m8B1Tjl.png" width="200" height="300"/></p>

*****

## ⏱️ 작업 기간
### 2024/04/16-2024/05/30(한달 반)
***

## ⚙ 기술 스택
|  카테고리  |스택|
| :-: | :-: |
|통합개발환경|<img src="https://img.shields.io/badge/Eclipse IDE-181717?style=flat&logo=Eclipse IDE" />
|사용한 언어| <img src="https://img.shields.io/badge/Java-darkblue?style=flat&logo=Java" /> <img src="https://img.shields.io/badge/Javascript-4B4B77?style=flat&logo=Javascript" /> <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat&logo=jQuery" />
|프론트엔드|<img src="https://img.shields.io/badge/HTML 5-302683?style=flat&logo=HTML5" /> <img src="https://img.shields.io/badge/CSS 3-1572B6?style=flat&logo=CSS3" />| 
|형상관리도구|<img src="https://img.shields.io/badge/Github-181717?style=flat&logo=github&logoColor=white" />
|데이터베이스|<img src="https://img.shields.io/badge/OracleDB-F80000?style=flat&logo=Oracle&logoColor=white" />
|협업 도구|<img src="https://img.shields.io/badge/Discord-5865F2?style=flat&logo=discord&logoColor=white" /> <img src="https://img.shields.io/badge/Adobe Photoshop-31A8FF?style=flat-square&logo=Adobe Photoshop&logoColor=white"/> <img src="https://img.shields.io/badge/Adobe Illustrator-FF9A00?style=flat-square&logo=Adobe Illustrator&logoColor=white"/>|
|API|  <img src="https://img.shields.io/badge/Kakao-FFCD00?style=flat&logo=Kakao&logoColor=white" /> <img src="https://img.shields.io/badge/Portone-darkblue?style=flat" />|
|WAS|<img src="https://img.shields.io/badge/Tomcat 9.0-F8DC75?style=flat&logo=Apache Tomcat&logoColor=black" />|
*****
## 💫주요 담당기능
<p align="center"><img src="https://i.imgur.com/EmVjbF9.png" width="250" height="250"/> <img src="https://i.imgur.com/9uoNujh.png" width="250" height="250"/></p>     
<p align="center"><img src="https://i.imgur.com/z34vVdP.png" width="250" height="250"/> <img src="https://i.imgur.com/ciRHw9x.png" width="250" height="250"/></p>

*****

## 📝요구 사항 정의서
<p align="center"><img src="https://i.imgur.com/lJbrCWt.png"/></p>   

*****

## 📝ERD
<p align="center"><img src="https://i.imgur.com/QPAtCZQ.png"/></p>    
<p align="center"><img src="https://i.imgur.com/Uoegp7F.png"/></p>    
<p align="center"><img src="https://i.imgur.com/oKlcOe7.png"/></p>    

*****

## 🖥 담당 기능 웹페이지
|  __메인 페이지__ | 기능 설명 |
| :------: | ----------- |
| <img src="https://i.imgur.com/1MpGv7b.jpeg" width="450" height="700" align="left"/> | <img src="https://i.imgur.com/UGDmmj9.png" width="300" /> |
| __홈페이지 헤더__ | 기능 설명 |
| <img src="https://github.com/woong1790/Semi_Project/assets/167398929/8fa94416-1144-49fd-b93c-c34f509bd8e0"/> | <img src="https://i.imgur.com/DdMH2X1.png" width="280" /> | 
| __상품 리스트__ | |
| <img src="https://github.com/woong1790/Semi_Project/assets/167398929/4e55dc8a-4b35-4f90-8dd2-57fd384b27b2" /> | <img src="https://i.imgur.com/JHMNn9h.png" width="250" /> |
| __상품 상세 페이지__ | |
| <img src="https://github.com/woong1790/Semi_Project/assets/167398929/12625c6c-76aa-46d0-903d-746d234f590a"/> <br>  <img src="https://i.imgur.com/4KevAbl.png" width="300" />  | <img src="https://i.imgur.com/kqENdrQ.png" width="300" /> |
| __상품 상세 페이지__ | |
| <img src="https://github.com/woong1790/Semi_Project/assets/167398929/f66f7a49-8529-48c3-9787-fab5b3ca3df1"/> | <img src="https://i.imgur.com/iGUWgPe.png" width="250" /> |

***

## 🛠️보완점 && 추가 계획
***
### 🔒 현재 페이징 처리 방식
***
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ajax를 사용하여 서버에서 미리 만들어진 JSP 페이지를 가져와 출력하는 방식으로 구현하였습니다. 
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이 방식은 초기 개발 단계에서 빠른 구현이 가능했지만, 데이터와 프레젠테이션의 분리 측면에서 개선의 여지가 있다고 생각했습니다. 
***
### 🔑 RESTful API 도입
***
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서버에서 HTML이 아닌 JSON 형태의 데이터만을 전송하여, 프론트엔드와 백엔드의 분리를 강화할 계획입니다.
####  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;RESTful API를 활용해 더 효율적인 데이터 전송과 클라이언트 사이드 렌더링을 구현할 수 있을 것이라 생각합니다.

*** 

### 🔑 코드 구조 개선 및 모듈화
***
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;코드의 가독성, 유지보수성, 그리고 재사용성을 높이기 위해 HTML은 JSP, CSS, JavaScript를 별도의 스크립트 파일로 분리하여 관리하고자 합니다.
#### &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이를 통해 코드의 가독성, 유지보수성, 그리고 재사용성을 크게 향상시킬 수 있을 것으로 기대합니다.

***

### 🔒 ajax 페이징 처리 
***
#### 상품리스트 페이지 > 카테고리 리스트 출력 구현 시 Ajax를 사용하여 서버에서 미리 만들어진 JSP 페이지를 가져와 출력하는 방식을 사용하고 클릭 이벤트 발생 시 해당 이벤트 태그의 event.target으로 해당 카테고리의 값을 들고왔었습니다.
#### 하지만 해당 카테고리를 선택하고 read-more(더보기) 페이징 처리시에 해당 카테고리 값을 한번 더 받아와야 하기때문에 난황을 겪었습니다.
***
### 🔑 cookie 활용
***
#### 해당 상황을 해결하기 위해 카테고리 클릭 시 event.target으로 받아온 값을 임시로 cookie에 저장하여 활용하는 방법을 택하였습니다 .
***
### ❗보완점
***
#### 하지만 cookie에 저장하게되면 단점도 있었습니다. 쿠키 사용에 대한 사용자 동의가 필요할 수도 있고, 여러 탭이나 창에서 동시에 다른 카테고리를 보고 싶을 때 문제 발생 할 수도있기때문에 
#### 추 후 sessionStorage를 활용하여 구현하는 방법으로 보완예정입니다. 
***
### 💫 느낀점
***
#### 이 프로젝트를 통해 계층형 카테고리 구조 구현, Ajax를 활용한 동적 데이터 로딩, 그리고 무한 스크롤 방식의 페이징 처리 등에 대해 실제적인 경험을 쌓을 수 있었습니다. 
#### 또한, 이벤트 처리와 데이터 파싱, RESTful API 설계와 데이터베이스 관리의 중요성을 크게 깨닳았고, 프론트엔드와 백엔드의 효율적인 연동 방법에 대해 깊이 있게 이해할 수 있었습니다.
#### 이 후의 프로젝트 참여 시 이러한 부분들을 더욱 고려하여 임할 수 있게 되었고, 현재 다른 팀원들의 구현 하지 못한 기능(결제, 암호화 등)을 직접 해볼수 있는 시간을 가져야겠다고 생각하게된 계기가 되었습니다. 
