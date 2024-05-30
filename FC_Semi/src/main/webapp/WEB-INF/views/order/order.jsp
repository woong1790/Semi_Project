<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.List,com.nbp.product.model.DTO.Product, com.nbp.order.model.dto.Order" %>
<%
	List<Product> p = (List<Product>)request.getAttribute("products");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
         <%
             String[] productNames = (String[]) request.getAttribute("productNames");
             String[] productCount = (String[]) request.getAttribute("productCount");
             String[] productPrices = (String[]) request.getAttribute("productPrices");
      		 Integer totalPriceObj = (Integer) request.getAttribute("totalPrice");
             

	    %>
            <div class="content " >
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
                            <img src="  " alt="와인" width="100%" height="100%">
                        </div>
                        <div style="margin: 10px; width: 50%; font-size: 12px;">
                            <div style="margin-top: 5%;">
                                <ul style="list-style: none; ">
                                    <li>상품명 : <span><%= productNames %></span></li><br>
                                    <li>수량 : <span><%= productCount %></span></li><br>
                                    <li>옵션목록 :<span></span></li>
                                </ul>
                            </div>
                        </div>
                        <div style="margin: 10px; width: 8%; text-align: center; "><%= productCount %></div>
                        <div style="margin: 10px; width: 8%; text-align: center;"><%= productCount %></div>
                        <div style="margin: 10px; width: 8%; text-align: center;">400원</div>
                        <div style="margin: 10px; width: 8%; text-align: center;">기본</div>
<%--                         <div style="margin: 10px; width: 8%; text-align: center;"><%=totalPrice %></div>
 --%>                    </div>
                    
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
                            	<div style="margin:10px">
                            	<input type="text" id="sample4_postcode" class="d_form mini" placeholder="우편번호">
						        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="d_btn"><br>
						        <input type="text" id="sample4_roadAddress" class="d_form std" placeholder="도로명주소">
						        <input type="text" id="sample4_jibunAddress" class="d_form std" placeholder="지번주소">
						        <span id="guide" style="color:#999;display:none"></span>
						        <input type="text" id="sample4_detailAddress" class="d_form" placeholder="상세주소">
        
                            	</div>
                          
                                
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
          <%-- <form action="<%=request.getContextPath() %>/pay/payment.do" method="post">
        	<button type="submit">카카오톡 결제</button>
   		</form> --%>
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
	<%-- const pay=()=>{
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
	} --%>
	//주소찾기
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 추가 정보 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    </script>
</body>
</html>