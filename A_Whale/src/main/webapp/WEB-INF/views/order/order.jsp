<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.List,com.nbp.product.model.DTO.Product, com.nbp.order.model.dto.Order" %>
<%
	Product p = (Product)request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
     *{
        margin:0;
        padding: 0;
    }
    a{
        text-decoration: none; 
    }
    .container{
        
        margin-left: 15%;
        margin-right: 15%;
        
    }
    .order-title{
        text-align: center;
        color: #333;
        font-weight: 1000;
        font-size: 30px;

    }
    .order-product-title{
        display: flex;
        justify-content: space-between;
        padding: 20px 48px 20px 16px;

    }
    .order-area{
        margin-bottom: 20px;
        border: 1px solid black;
    }
    .order-box{
        margin: 0px 20px 15px 50px;
        display: flex;
        justify-content: space-between;
    }
    .deliver{
        padding: 11px 16px 11px 16px;
        
    }
    .deliver-detail{
        display: flex;
        justify-content: space-between;
    }
    .order-box-detail{
        display: flex;
    }

    .arrived-location-info{
        display: flex;
        justify-content: space-between;
        padding: 20px 48px 20px 16px;
    }
    .receiver-1{
       padding:12px 0px 12px 12px;
    }
    table{
        border-spacing:0;
        /* border-collapse: collapse; */
    }
    .address-1{
        padding:12px 0px 12px 12px;
    }
    /* .address-2 input{
        height: 30px;
    } */
    .hidden {
        display: none;
    }
    input{
        height: 22px;
    }    
    .deliver-message{
        padding: 20px 16px 15px 16px;
        
        
    }
    select{
        
        justify-content: center;
    }

    /* 결제 */
    .payment-way-title{
        display: flex;
        justify-content: space-between;
        padding: 20px 48px 20px 16px;
    }
    #payment-way-select{
        text-align: start;
    }
    .selectway{
        text-align: start;
    }
    .selectway>div{
        padding:5px 20px 5px 20px
    }
    .nobankbook {
        display: none;
    }
    input[type="number"]::-webkit-inner-spin-button,
    input[type="number"]::-webkit-outer-spin-button{
        -webkit-appearance: none;
        margin: 0;
    }

    /* #hoverdiv:hover{
        border: solid magenta;
    } */

    .selectway{
        cursor:pointer;
    }
    .selectway.selected{
        border: 0.7px solid blue;
       
    }
    .selectway.selected p {
        color: blue;
    }


</style>
<body>
    <header style="height: 120px;">헤더자리</header>
    <div class="order-title" style="background-color: rgb(168, 168, 168); color:aliceblue; position: relative; width: 100%; margin: 0; height: 100px; align-content: center;" >
        O R D E R
    </div>
    <div class="container">
        <div id="order-product" style="border: 1px solid black">
            <div class="order-product-title" style="height: 50px; align-items: center;" >
                <h3 >주문상품</h3><span></span><button id="toggle-button">버튼</button>
            </div>
            <div class="content hidden" >
                <div class="product-list">
                    <div style="display: flex; margin: 20px 0px 20px 0px; font-size: 13px; text-align: center; background-color: rgb(216, 216, 216);">
                        <div style="margin: 10px; width: 10%; ">이미지 </div>
                        <div style="margin: 10px; width: 50%;  text-align: start; align-content: center;">상품정보</div>
                        <div style="margin: 10px; width: 8%; ">판매가</div>
                        <div style="margin: 10px; width: 8%; ">수량</div>
                        <div style="margin: 10px; width: 8%; ">적립금</div>
                        <div style="margin: 10px; width: 8%; ">배송구분</div>
                        <div style="margin: 10px; width: 8%; ">합계</div>
                    </div>
                    <div class="product"style="display: flex; margin: 20px 0px 0px 0px; font-size: 12px; border-bottom: 0.5px solid black;">
                        <div style="margin: 10px ; width: 10%;">
                            <img src="<%=p.getProductImg() %>" alt="와인" width="100%" height="100%">
                        </div>
                        <div style="margin: 10px; width: 50%; font-size: 12px;">
                            <div style="margin-top: 5%;">
                                <ul style="list-style: none; ">
                                    <li>상품명 : <span><%=p.getProductName() %></span></li><br>
                                    <li>수량 : <span><%=p.getProductImg() %></span></li><br>
                                    <li>옵션 : <span>도수 10도</span></li>
                                </ul>
                            </div>
                        </div>
                        <div style="margin: 10px; width: 8%; text-align: center; ">39,900</div>
                        <div style="margin: 10px; width: 8%; text-align: center;">1</div>
                        <div style="margin: 10px; width: 8%; text-align: center;">400원</div>
                        <div style="margin: 10px; width: 8%; text-align: center;">기본</div>
                        <div style="margin: 10px; width: 8%; text-align: center;">39,900원</div>
                    </div>
                    <div class="product" style="display: flex; margin: 20px 0px 0px 0px; font-size: 12px; border-bottom: 0.5px solid black;">
                        <div style="margin: 10px ; width: 10%;">
                            <img src="https://dimg.donga.com/wps/NEWS/IMAGE/2020/06/22/101631738.2.jpg" alt="와인" width="100%" height="100%">
                        </div>
                        <div style="margin: 10px; width: 50%; font-size: 12px;">
                            <div style="margin-top: 5%;">
                                <ul style="list-style: none; ">
                                    <li>상품명 : <span>가나다라마바</span></li><br>
                                    <li>수량 : <span>1개</span></li><br>
                                    <li>옵션 : <span>도수 10도</span></li>
                                </ul>
                            </div>
                        </div>
                        <div style="margin: 10px; width: 8%; text-align: center; ">39,900</div>
                        <div style="margin: 10px; width: 8%; text-align: center;">1</div>
                        <div style="margin: 10px; width: 8%; text-align: center;">400원</div>
                        <div style="margin: 10px; width: 8%; text-align: center;">기본</div>
                        <div style="margin: 10px; width: 8%; text-align: center;">39,900원</div>
                    </div>
                    <div class="deliver">
                        <div class="deliver-detail" style="font-size: 15px;">
                            <h4>배송비</h4><span>2500원</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="background-color: rgb(255, 255, 255);">
            <br>
        </div>


        <div id="deliver-address" style="border: 1px solid black; background: white; padding:10px">
            <div class="arrived-location-info" >
                <h3>배송지</h3><button id="toggle-button2">버튼</button>
            </div>
            <div class="location_detail_info">
                <table border="1" style="width: 100%;">
                    <colgroup>
                        <col style="width: 150px">
                        <col style="width:auto">
                    </colgroup>
                    <tbody>
                        <tr class="receiver">
                            <th class="receiver-1" scope="row">받는사람
                                <span><img width="5" height="5" src="https://img.icons8.com/ios-filled/50/starburst-shape.png" alt="starburst-shape"/></span>
                            </th>
                            <td style="padding: 8px 16px 7px 4px;">
                                <input type="text" id="name" name="mname" placeholder size="15" style="margin-left: 15px;">
                            </td>
                        </tr>
                        <tr class="address" >
                            <th class="address-1" scope="row" >주소
                                <span><img width="5" height="5" src="https://img.icons8.com/ios-filled/50/starburst-shape.png" alt="starburst-shape"/></span>
                            </th>
                            <td class="address-2" >
                                <ul style="list-style: none;">
                                    <li>
                                        <input type="text" name="searchaddress" placeholder="우편번호" maxlength="15" readonly style=" width: 180px; margin:20px 0 5px 15px;"> &nbsp;&nbsp; 
                                        <button>주소검색</button>
                                    </li>
                                    <li>
                                        <input type="text" name="basicaddress" placeholder="기본주소" maxlength="100" readonly style="margin:10px auto 5px 15px;">
                                    </li>
                                    <li>
                                        <input type="text" name="restaddress" placeholder="상세주소" maxlength="250" size="60" style="margin:10px auto 20px 15px;">
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">일반전화
                                <span><img width="5" height="5" src="https://img.icons8.com/ios-filled/50/starburst-shape.png" alt="starburst-shape"/></span>
                            </th>
                            <td>
                                <div style="margin: 20px 15px;">
                                    <select name="phonenumber" id="phone-1">
                                        <option value="02">02</option>
                                        <option value="031">031</option>
                                        <option value="070">070</option>
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="019">019</option>
                                    </select>
                                    -
                                    <input type="number" name="phonenumber" id="phone-2" maxlength="4" style="width: 80px;">
                                    -
                                    <input type="number" name="phonenumber" id="phone-3" maxlength="4" style="width: 80px;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">이메일
                                <img width="5" height="5" src="https://img.icons8.com/ios-filled/50/starburst-shape.png" alt="starburst-shape"/></span>
                            </th>
                            <td>
                                <div style="margin: 20px 15px;">
                                    <input type="text">
                                    @
                                    <span>
                                        <select name="" id="">
                                            <option value="naver.com">naver.com</option>
                                            <option value="daum.com">daum.com</option>
                                            <option value="gmail.com">gmail.com</option>
                                            <option value="직접입력">직접입력</option>
                                        </select>
                                        <span>
                                            <input type="text">
                                        </span>
                                    </span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div  style="border: 1px solid black; display: flex; ">
                    <div style="width: 150px; border-right: 1px solid black; text-align: center; align-content: center;">
                        <h4>배송 메모</h4>
                    </div>
                    <div style="display: flex;">
                        <div class="deliver-message" style=" align-items: center; ">
                            <select name="" id="" style="width:100%; height: 30px;" >
                                <option value="">--메세지 선택(선택사항)--</option>
                                <option value="">배송 전에 미리 연락주세요</option>
                                <option value="">부재시 경비실에 맡겨주세요</option>
                                <option value="">부재시 문 앞에 놓아주세요</option>
                                <option value="">빠른 배송 부탁드립니다</option>
                                <option value="">택배함에 보관해주세요</option>
                                <option value="">직접입력</option>
                            </select>
                        </div>
                        <div style="display: flex; margin: 5px; align-items: center; justify-content: end;">
                            <div style="display: flex;">
                                <input id="basiclocation" type="checkbox"><label for="basiclocation">&nbsp;기본배송지로 저장</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <div style="background-color: rgb(255, 255, 255);">
            <br>
        </div>
        
        <div class="payment-way" style="border: 1px solid black; padding:10px">
            <div>
                <div id="payment-way-title" style="margin-left: 5px; padding: 20px 48px 20px 16px;">
                    <h3>결제수단</h3>
                </div>
            </div>
            <div>
                <h4 id="payment-way-select" style="margin-left: 15px; margin-bottom: 5px; margin-top: 10px; font-size: 13px;">
                    결제수단 선택
                </h4>
                <div>
                    <div style="margin:10px 10px 10px 10px ;border: 0.5px solid rgb(173, 173, 173);">
                        <div id="hoverdiv" class="selectway" onclick="showPaymentOption('nobankbook')">
                            <div style="font-size: 12px; margin: 10px;">
                                <p>무통장 입금</p>
                            </div>
                        </div>
                        <div class="selectway" style="border-bottom: 0.5px solid rgb(173, 173, 173);" onclick="showPaymentOption('paycard')">
                            <div style="font-size: 12px; margin: 10px;">
                                <p>카드결제</p>
                            </div>
                        </div>
                        <div class="selectway" style="border-bottom: 0.5px solid rgb(173, 173, 173);" onclick="showPaymentOption('payphone')">
                            <div style="font-size: 12px; margin: 10px;">
                                <p>휴대폰 결제</p>
                            </div>
                        </div>
                        <div class="selectway" style="border-bottom: 0.5px solid rgb(173, 173, 173);" onclick="showPaymentOption('kakaopay')">
                            <div style="font-size: 12px; margin: 10px;">
                                <p>카카오페이(간편결제)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="background-color: rgb(242, 236, 236);">
            <br>
        </div>
    
        <div id="nobankbook" class="payment-option nobankbook" style="font-size: 13px; border:1px solid black; display: none;">
            <div style="display:flex; justify-content:space-evenly; border-bottom: 0.5px solid rgb(173, 173, 173);">
                <div style="margin:10px; align-content: center;">
                    입금은행
                </div>
                <div style="width: 70%;">
                    <div style="justify-content: center;">
                        <select name="" id="" style="margin:10px 30px 10px 30px; height:25px; width: 90%; justify-content: center;">
                            <option value="">::선택해주세요::</option>
                            <option value="">신한은행 111-111-11111-111</option>
                        </select>
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content:space-evenly; border-bottom: 0.5px solid rgb(173, 173, 173);">
                <div style="margin:10px; align-content: center;">
                    입금자명
                </div>
                <div style="height:30px; width: 70%; align-content: center;">
                    <input type="text" style="margin:15px 30px 10px 30px; height:20px; width: 90%;">
                </div>
            </div>
            <div style="display: flex; justify-content:space-evenly;">
                <div style="margin:10px; align-content: center;">
                    현금영수증
                </div>
                <div style="height:30px; width: 70%;">
                    <div style="display: flex; justify-content:space-evenly; margin:10px 30px 10px 30px;">
                        <div style="display: flex;">
                            <input id="oksubmit" type="checkbox"><label for="oksubmit">&nbsp;현금영수증 신청</label>  
                        </div>
                        <div style="display: flex;">
                            <input id="nosubmit" type="checkbox"><label for="nosubmit">&nbsp;신청 안함</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div id="paycard" class="payment-option paycard" style="font-size: 13px; border:1px solid black; display: none;">
            <div>
                <div style="display: flex; margin: 20px 40px 20px 40px;">
                    <input id="indivisual" type="checkbox"><label for="indivisual">&nbsp;개인</label>&nbsp;&nbsp;
                    <input id="corporate" type="checkbox"><label for="corporate">&nbsp;법인</label>
                </div>
            </div>
            <div>
                <div style="margin: 20px 40px 20px 40px; height: 20px;">
                    <select name="" id="" style="width: 50%; min-height: auto; height: 30px;">
                        <option value="">카드를 선택해주세요</option>
                        <option value="">현대</option>
                        <option value="">신한</option>
                        <option value="">비씨</option>
                        <option value="">삼성</option>
                        <option value="">하나</option>
                    </select>
                </div>
            </div>
            <div>
                <div style="margin: 20px 40px 20px 40px; height: 20px;">
                    <select name="" id="" style="width: 50%; min-height: auto; height: 30px;">
                        <option value="">일시불</option>
                        <option value="">할부</option>
                    </select>
                </div>
            </div>
        </div>
    
        <div id="payphone" class="payment-option payphone" style="font-size: 13px; border:1px solid black; display: none;">
            <div style="margin: 10px; border-bottom: 2px solid black;">
                <div style="margin-bottom: 5px;">
                    <h4>휴대폰 결제</h4>
                </div>
            </div>
            <div style="margin: 10px;">
                <div style="display: flex;justify-content: center;">
                    <div>
                        <div style="margin: 10px;"><input  id="numberInput1" type="number" style="width: 100%; box-sizing: border-box; outline-style: none; height: 25px;" maxlength="3"></div>
                    </div>
                    <span style="font-size: 20px; align-content: center;">&nbsp;-&nbsp;</span>
                    <div>
                        <div  style="margin: 10px;"><input  id="numberInput2" type="number" style="width: 100%; box-sizing: border-box; outline-style: none; height: 25px;" maxlength="4" ></div>
                    </div>
                    <span style="font-size: 20px; align-content: center;">&nbsp;-&nbsp; </span>
                    <div>
                        <div style="margin: 10px;"><input  id="numberInput3" type="number" style="width: 100%; box-sizing: border-box; outline-style: none; height: 25px;" maxlength="4"></div>
                    </div>
                </div>
            </div>
        </div>
          <div style="font-size: 13px; border:1px solid black; padding: 15px;">
              <div>
                  <div style="display: flex;">
                      <input id="provision" type="checkbox"><label for="provision">&nbsp;모든 약관 동의</label>
                  </div>
              </div>
              <div>
                  <div>
                      <div>
                          <p>[필수] 쇼핑몰 이용약관 동의</p>
                      </div>
                  </div>
                  <div>
                      <div>
                          <p>[필수] 개인정보 수집 및 이용 동의</p>
                      </div>
                  </div>
              </div>
          </div>
          <div>
              <br>
          </div>
          <button onclick="pay();" style="background-color: blue;  width: 100%; height: 80px; font-size: larger;">
              <!-- <a href="#" style="color: white;"><span style="background-color: rgb(19, 19, 252) ">35000</span>원<span>&nbsp;결제하기</span></a> -->
          		결제하기
          </button>
      </div>

    </div>
    <div style="height: 120px;">
        푸터
    </div>
    <script>
       
        document.getElementById("toggle-button").addEventListener("click", function() {
            var contentDiv = document.querySelector("#order-product .content");
            if (contentDiv.classList.contains("hidden")) {
                contentDiv.classList.remove("hidden");
            } else {
                contentDiv.classList.add("hidden");
            }
        });
        document.getElementById("toggle-button2").addEventListener("click", function() {
            var contentDiv = document.querySelector("#deliver-address .location_detail_info");
            if (contentDiv.classList.contains("hidden")) {
                contentDiv.classList.remove("hidden");
            } else {
                contentDiv.classList.add("hidden");
            }
        });

        document.addEventListener('DOMContentLoaded', function() {
            var hoverdiv = document.getElementById('hoverdiv');

            hoverdiv.addEventListener('click', function() {
                // Toggle the 'selected' class
                hoverdiv.classList.toggle('selected');
            });
        });
	        function showPaymentOption(optionId) {
	    var options = document.querySelectorAll('.payment-option');
	    
	    
	    options.forEach(function(option) {
	        option.style.display = 'none';
	    });
	    
	    
	    var selectedOption = document.getElementById(optionId);
	    selectedOption.style.display = 'block';
	}
	
	document.addEventListener('DOMContentLoaded', function() {
	    var selectWays = document.querySelectorAll('.selectway');
	    
	    selectWays.forEach(function(selectWay) {
	        selectWay.addEventListener('click', function() {
	            selectWays.forEach(function(way) {
	                way.classList.remove('selected');
	            });
	            selectWay.classList.add('selected');
	        });
	    });
	});
	    
	
	
	document.addEventListener('DOMContentLoaded', function() {
	    var numberInput = document.getElementById('numberInput1');
	
	    numberInput.addEventListener('input', function() {
	        if (this.value.length > 3) {
	            this.value = this.value.slice(0, 3);
	        }
	    });
	});
	document.addEventListener('DOMContentLoaded', function() {
	    var numberInput2 = document.getElementById('numberInput2');
	
	    numberInput2.addEventListener('input', function() {
	        if (this.value.length > 4) {
	            this.value = this.value.slice(0, 4);
	        }
	    });
	});
	document.addEventListener('DOMContentLoaded', function() {
	    var numberInput3 = document.getElementById('numberInput3');
	
	    numberInput3.addEventListener('input', function() {
	        if (this.value.length > 4) {
	            this.value = this.value.slice(0, 4);
	        }
	    });
	});
	
	/* 결제하기버튼  */
	const pay=()=>{
		const data = {
                cid: "TC0ONETIME",
                partner_order_id: "order_id",
                partner_user_id: "user_id",
                item_name: "item_name",
                quantity: 1,
                total_amount: 1000,
                vat_amount: 100,
                tax_free_amount: 0,
                approval_url: "http://localhost:9090/payment/approve",
                cancel_url: "http://localhost:9090/payment/cancel",
                fail_url: "http://localhost:9090/payment/fail"
            };

            fetch('<%=request.getContextPath()%>/pay/payment.do', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                window.open('https://online-pay.kakao.com/mockup/v1/b05143eeeb1cd5537e8a6287bfc4878ee10f86795141d31f10b3c84ba1de873b/info');
            })
            .catch(error => console.error('Error:', error));
	}

    </script>
</body>
</html>