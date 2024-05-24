<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <style>
     body{
          background-image: url("https://images.unsplash.com/photo-1629196911514-cfd8d628ba26?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
          background-size: 100%;
          font-family:KoPubWorldDotum;

        }
    @font-face {
      font-family: 'Freesentation-9Black';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/Freesentation-9Black.woff2') format('woff2');
  
    }
    
    #product-detail-main{
      display: flex;
      justify-content: center;
      align-items: center;
      justify-content: space-evenly;
      background-color:  rgba(255, 255, 255, 0.7);
      margin-top: 30px;
      position: sticky; 
      top: 120px; 
      z-index: 1000;
  
    }
  
    #product-detail-main>div{
        display: flex;
        justify-content: center;
        opacity: 0.5;
        align-items: center;
        color:rgb(10, 10, 169);
        width : 170px;
        height : 50px;
        font-family: 'Freesentation-9Black';
        font-weight: lighter;
        border-bottom: 5px solid rgba(216, 216, 216, 0);
        transition: all 0.2s ease-in;
        cursor: pointer;
        font-size: 25px;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.717);
    }
  
    #product-detail-main>div:first-of-type{
        opacity: 1;
        border-bottom: 5px solid rgb(10, 10, 169)
    
    }
  
    #product-detail-main>div:hover{
      opacity: 1;
    border-bottom: 5px solid rgb(8, 8, 136);
    }

    #information-main-container{
      display: flex; 
      justify-content: center; 
      align-items: center; 
      width: 60%; 
      margin: 0 auto;
    }
    
    #information-container{
      position: relative;
      height: 1000px;
      margin-top: 60px;
    }

    .information-img{
        width: 100%;
        
    }

    .gradation{
        width: 100%;
        position: absolute;
        bottom: 0px;
        box-shadow: inset 0 -2px 0 0 #ffffff; 
    }

    .information-more-btn{
        position: absolute;
        width:100%;
        bottom: 0;
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .information-more-btn>img{
        margin-left: auto;
        margin-right: auto;
        opacity: 1;
        cursor: pointer;
        transition: all 0.25s ease-in;
    }
    .information-more-btn>img:hover{
      opacity: 0.7;
    }
/* ----------------리뷰 테이블 스타일 ----------------------- */
#product-review{
			display:flex;
			justify-content:center;
			align-items:center;
			flex-direction:column;
      		width: 100%;
			margin-bottom:200px;
      		margin-top: 150px;
      		border-top: 3px solid rgb(125, 125, 125);
      		text-align:center;
		}

    #review-title{
      font-family: 'Freesentation-9Black';
        font-size: 25px;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.717);
        color:rgb(10, 10, 169);
        margin: 40px 0;
    }
		
		.review-table {
		  width: 100%;
		  border-collapse: collapse;
		  background-color: #fff;
		}
		
		.review-table th, .review-table td {
		  padding: 12px 15px;
		  text-align: left;
		  border: 1px solid #ddd; /* 테두리 스타일 */
		}
		
		.review-table th {
		  background-color: #f4f4f4; /* 헤더 배경색 */
		  font-weight: bold;
		}
		
		.review-table img {
		  width: 100px;
		  height: auto;
		  border-radius: 5px;
		}
		
		.review-table tbody tr:nth-child(even) {
		  background-color: #f9f9f9; /* 짝수 행 배경색 */
		}
		
		.review-table tbody tr:hover {
		  background-color: #f1f1f1; /* 마우스 오버 시 배경색 */
		}
		
		.review-content{
			cursor:pointer;
		}
		
		.review-detail{
			
		}


  
  </style>
  <div style="height: auto;">
  <!-- information ,review, Q&A 카테고리 생성 -->
    <div id="product-info-list" class="border" style="height: 15px; margin-top: 20px; border-bottom: 8px solid rgb(9, 9, 71);border-top: 3px solid rgb(9, 9, 71);"></div>
        <div id="product-detail-main" class="border" >
          <div>information</div>
          <div>review</div>
          <div>Q&A</div>
        </div>
        
    <script>
      // 상품정보,리뷰,질문 클릭 이벤트
    $("#product-detail-main>div").click(e=>{
      $(e.target).parent().children().css("opacity",0.5);
      $(e.target).css("opacity",1);
    
      $(e.target).parent().children().css("border-bottom","5px solid rgba(10, 10, 169,0)");
      $(e.target).css("border-bottom","5px solid rgb(8, 8, 136)");
    });


    
    </script>

    <!-- 상세페이지 설명, 이미지 -->
      <div id="information-main-container">
            <div id="information-container">
                 <div id="information-img" style="height: 1000px; overflow: hidden;"><img class="information-img" src="https://i.imgur.com/VON4Oy9.jpeg"></div>
                  <div><img class="gradation" src="https://i.imgur.com/CwX3HEQ.png"></div>
                  <div class="information-more-btn"><img src="https://i.imgur.com/SBtS55i.png" width="200px"></div>
            </div>
      </div>

      <script>
        // 더보기 버튼 클릭시 이미지 나오게 하는 함수
            $(document).on('click', '.information-more-btn', function() {
        $("#information-img").css('height','auto');
        document.getElementById("information-img").style.overflow='visible';
        $("#information-container").css('height','auto');

        document.getElementById("information-container").style.overflow='visible';
        $(".gradation").css("display","none");
        $(".information-more-btn").css("display","none");
});
      </script>

     <!-- 리뷰 테이블 생성 -->
     <div id="product-review">
      <div id="review-title">review</div>
      <div style="display: flex; align-items: center; width: 60%;">
        <table width="100%">
          <thead>
              <tr>
                  <th>번호</th>
                  <th>이미지</th>
                  <th>리뷰 제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
              </tr>
          </thead>
          <tbody class="table-group-divider">
              <tr class="review-detail">
                  <td>1</td>
                  <td>  <img src="https://i.imgur.com/spsVERs.png" alt="Review Image 1" width="50"></td>
                  <td>안녕하세요</td>
                  <td>user01</td>
                  <td>2024.05.24</td>
              </tr>
              <tr class="review-content">
                  <td colspan='3' style="padding:30px;">
                      <img src="https://i.imgur.com/spsVERs.png" alt="Review Image 1" width="200">
                      <img src="https://i.imgur.com/spsVERs.png" alt="Review Image 1" width="200">
                      <td colspan='2' style="padding:30px;">
                      리뷰 내용 들어갈 예정
                  </td>
                  </td>
              </tr>
              <tr class="review-detail">
                <tr class="review-detail">
                  <td>2</td>
                  <td>  <img src="https://i.imgur.com/spsVERs.png" alt="Review Image 1" width="50"></td>
                  <td>안녕하세요....</td>
                  <td>user02</td>
                  <td>2024.05.24</td>
              </tr>
              </tr>
              <tr class="review-content">
                  <td colspan='3' style="padding:30px;">
                      <img src="https://i.imgur.com/spsVERs.png" alt="Review Image 2" width="200">
                      <img src="https://i.imgur.com/spsVERs.png" alt="Review Image 2" width="200">
                  </td>
                  <td colspan='2' style="padding:30px;">
                      리뷰 내용 들어갈 예정
                  </td>
              </tr>
          </tbody>
      </table>
        
      <script>
        $(document).ready(function() {
            $('.review-content').hide();
        });
        $(document).ready(function() {
            $('.review-detail').on('click', function() {
              var contentRow = $(this).next('.review-content');
              $('.review-content').not(contentRow).slideUp(1);
                contentRow.slideToggle(1);
            });
        });
    </script>
      </div>
     </div>
    </div>




