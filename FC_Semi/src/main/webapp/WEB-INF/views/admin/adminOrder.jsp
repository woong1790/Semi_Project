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
                	<div>�ֹ� ����</div>
                </div>
                <div>
                	<button onclick="searchPayments()">�ֹ� ��ȸ</button>
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
            console.log("���� ����:", response); // ���� ������ �ֿܼ� ���
            try {
                // JSON ���� ���� Ȯ��
                if (typeof response === "string") {
                    response = JSON.parse(response);
                }
                console.log("�Ľ̵� ����:", response);
                if (response.response) {
                    displayPaymentsInfo(response.response.list); // "list" �ʵ带 ���
                } else if (response.error) {
                    alert("���� ����: " + response.error);
                } else {
                    alert("���� ������ �����ϴ�.");
                }
            } catch (error) {
                alert("���� ������ �Ľ��ϴ� �� ������ �߻��߽��ϴ�.");
                console.log("�Ľ� ����:", error);
            }
        },
        error: function(error) {
            alert("���� ������ ��ȸ�� �� �����ϴ�.");
            console.log("AJAX ����:", error);
        }
    });
}

function displayPaymentsInfo(paymentInfos) {
    let html = '<table style="border: 1px solid black;">' +
	            '<tr>' +
	            '<th>UID/MID</th>' +
	            '<th>�ֹ���</th>' +
	            '<th>������</th>' +
	            '<th>���� ����</th>' +
	            '<th>���������</th>' +
	            '<th>���� �ݾ�</th>' +
	            
	            '<th>���� ���</th>' +
	            '<th>���� �Ͻ�</th>' +			      
	            
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