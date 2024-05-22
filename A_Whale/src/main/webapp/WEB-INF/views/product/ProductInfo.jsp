<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/common/subHeader.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 페이지</title>
<style>
 #product-main{
    display: flex;
    justify-content: center;
    justify-content: space-between;
    align-items: center;
    background-image: url("https://i.imgur.com/t1HFAVE.jpeg");
    background-size: 100% 100%;
    background-position: center;
    transition: all 0.35s ease-in;
   } 
   #product-main:hover{
    background-size: 108% 108%;
   }     


   .product-title{
    color: white;
    font-weight: bolder;
    font-size: 30px;
    height: 150px;

   }

   .product-sub-title{
    color: white;
    font-family: GmarketSans;
    font-size: 15px;
    font-weight: lighter;

   }

   .price{
    color: white;
    font-family: GmarketSans;
    font-size: 30px;
    border-width: 0;
    background-color: transparent;
    width: 15 0px;

   }

   .price-menu{
    
    height: 100px;
    width: 500px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
   }
   
   .product-pic:hover{
    opacity: 0.5;
   }
   
   #product-count{
    font-size: 20px;
    color: white;
   }

   .detail{
    display: flex;
    justify-content: center;
    justify-content: space-evenly;
    align-items: center;
    width: 100px;
   }

  .font{
    color: white;
  }

  #parchase{
    display: flex;
    justify-content: center;
    justify-content: space-evenly;
    align-items: center;
  }

  

  #product-sub-main{
    display: flex;
    flex-direction: column;
    align-items: center;

  }

  #parchase{
    height:50px; 
    width: 300px; 
    border: 2px solid white;
    margin-top: 40px;
    border-radius: 5px;
    color: white;
    transition: all 0.25s ease-in;
  }

  #parchase:hover{
    background-color: white;
    color: rgb(3, 1, 57);
    cursor: pointer;
  }

  #cart{
    font-size: 30px; 
    font-weight: bolder; 
    color: rgb(3, 1, 57); 
    background-color: white;
    width: 145px;
    height: 50px;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: all 0.25s ease-in;
  }

  #cart:hover{
    color:white ;
    background-color: rgb(3, 1, 57);
    cursor: pointer;
    
  }

  #cart>p{
    margin-bottom: 5px;
  }

  #wish-img{
    font-size: 30px; 
    font-weight: bolder; 
    width: 145px;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: inset  0 0 0 2px white;
    border-radius: 10px;
    cursor: pointer;
  }
  

  #product-detail-main{
    height: 1000px;
    min-width: 1400px;
  }


     .border{
        border: 1px solid red;
    } 

    select, #total {
            margin-top: 10px;
            display: block;
        }
        select {
            padding: 5px;
            font-size: 16px;
        }
        #total {
            margin-top: 15px;
            font-weight: bold;
        }

    </style>

</head>
<body>
 <section>
        <div id="product-main" class="border" style="margin-top: 100px; height: 800px; min-width: 1400px;">
            <div class="border" style="height: 800px; width: 500px; margin-right: 20px;">
    
            </div>
            <!-- 오른쪽 상품 상세 메뉴들 -->
            <div id="product-sub-main" class="border" style="height: 800px; width: 500px; margin-left: 20px; margin-right: 60px;">
                <p class="product-title"><br>A.Whale 시그니처 와인.<br> wine.</p>
                <p class="product-sub-title">Experience the magic of our spirits</p> <br><br><br>
                <!-- 가격, 카운트 업,다운 버튼 -->
                <div class="price-menu border">
                  <div>
                    <span style="color: white; font-size: 35px;">\ </span><span id="price" style="color: white; font-size: 40px;">79000</span><br>
                  </div>
                    <div class="border detail" style="display: flex;">
                    <div id="minus"><img src="./images/down.png" alt="" width="20px" height="15px"></div>
                    <div id="product-count">1</div>
                    <div id="plus"><img src="./images/up.png" alt="" width="20px" height="15px"></div>
                  </div>
                </div>
                <!-- 추가 구매상품 선택 리스트 -->
                <label for="product">제품 선택:</label>
                <select id="product" onchange="updateTotal()">
                    <option value="0">선택하세요</option>
                    <option value="5000">얼음틀 : 5,000원</option>
                    <option value="25000">잔 : 25,000원</option>
                    <option value="1500">선물포장 : 1,500원</option>
                </select>
                <!-- 구매, 장바구니, 위시리스트 버튼 -->
              <div id="parchase">
                <p style="font-size: 30px; font-weight: bolder; padding-bottom: 3px;">PARCHASE</p>
              </div>
              <div style="display: flex; flex-direction: row; justify-content: center; justify-content: space-between; align-items: center; width: 310px; margin-top: 10px;">
                <div id="cart"><p>cart</p></div>
                <div id="wish-img"><img src="./images/heart01.png" width="40px"></div>
              </div>
              <!-- 상품 설명 -->
              <div style="color: white; width: 400px; margin-top: 50px; border-top: 3px solid rgb(255, 255, 255);"> <br>Whiskey, also spelled whisky in some regions, is a distilled alcoholic beverage made from fermented grain mash. The grains used in whiskey production can include barley, corn, rye, and wheat. The production process typically involves mashing the grains, fermenting the mash, distilling the liquid, and aging it in wooden barrels.<br> </div>
            </div>
        </div>
    
    </section>
    <script>
      const plus = document.getElementById("plus");
      const down = document.getElementById("minus");
      let price = document.getElementById("price");
      const count = document.getElementById("product-count");
      let priceCount=79000;
      let countResult=1;
      plus.addEventListener("click",e=>{
          if(priceCount>=79000 || countResult>=1){
            countResult+=1;
            priceCount+=79000;
          count.innerHTML=countResult;
          price.innerHTML=priceCount;
          console.log(priceCount);
          }
      });

      down.addEventListener("click",e=>{
        if(priceCount>79000 || countResult!=1){
          countResult-=1;
          priceCount-=79000;
        count.innerHTML=countResult;
        price.innerHTML=priceCount;
        down.style.opacity=1;
        }
      });
    </script>
    <div class="border" style="height: 15px; margin-top: 20px; border-bottom: 8px solid rgb(9, 9, 71);border-top: 3px solid rgb(9, 9, 71); min-width: 1400px;"></div>
    <div id="product-detail-main" class="border">상품 설명, 리뷰, Q&A

    </div>
	
</body>
</html>