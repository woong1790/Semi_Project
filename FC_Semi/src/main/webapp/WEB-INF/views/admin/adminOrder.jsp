<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<section id="orderSection">
                <div>
                	<div>주문 관리</div>
                </div>
                <div>
                	<button onclick="searchPayments()">주문 조회</button>
    				<div id="paymentInfos" style="justify-content:center; margin:20px 0 20px 100px"></div>
			    
			    <table id="ordersTable" style="border: 1px solid black;">
			    
			    </table>
                </div>
                
                
            </section>

<script >
function searchPayments() {
    $.ajax({
        url: "<%=request.getContextPath()%>/admin/getAllPayments.do",
        type: 'GET',
        contentType: "application/json; charset=utf-8",
        success: function(response) {
            console.log("서버 응답:", response); // 응답 내용을 콘솔에 출력
            try {
                // JSON 응답 형식 확인
                if (typeof response === "string") {
                    response = JSON.parse(response);
                }
                console.log("파싱된 응답:", response);
                if (response.response) {
                    displayPaymentsInfo(response.response.list); // "list" 필드를 사용
                } else if (response.error) {
                    alert("서버 에러: " + response.error);
                } else {
                    alert("결제 정보가 없습니다.");
                }
            } catch (error) {
                alert("결제 정보를 파싱하는 중 오류가 발생했습니다.");
                console.log("파싱 오류:", error);
            }
        },
        error: function(error) {
            alert("결제 정보를 조회할 수 없습니다.");
            console.log("AJAX 오류:", error);
        }
    });
}

function displayPaymentsInfo(paymentInfos) {
    let html = '<table style="border: 1px solid black;">' +
	            '<tr>' +
	            '<th>UID/MID</th>' +
	            '<th>주문명</th>' +
	            '<th>고객정보</th>' +
	            '<th>결제 상태</th>' +
	            '<th>결제대행사</th>' +
	            '<th>결제 금액</th>' +
	            
	            '<th>결제 방법</th>' +
	            '<th>결제 일시</th>' +			      
	            
	            '</tr>';
    paymentInfos.forEach(function(paymentInfo) {
    	html += '<tr>';
        html += '<td>' + paymentInfo.imp_uid + '</td>';
        html += '<td>' + paymentInfo.name + '</td>';
        html += '<td>' + paymentInfo.buyer_name + '</td>';
        html += '<td>' + paymentInfo.status + '</td>';
        html += '<td>' + paymentInfo.pg_provider + '</td>';
        html += '<td>' + paymentInfo.amount + '</td>';
        html += '<td>' + paymentInfo.pay_method + '</td>';
        html += '<td>' + new Date(paymentInfo.paid_at * 1000).toLocaleString() + '</td>';
        
        html += '</tr>';
    });
    html += '</table>';
    document.getElementById("paymentInfos").innerHTML = html;
}

</script>
</body>
</html>