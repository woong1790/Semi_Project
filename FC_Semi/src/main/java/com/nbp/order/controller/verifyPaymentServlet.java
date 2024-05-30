package com.nbp.order.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class verifyPaymentServlet
 */
@WebServlet("/order/verifyPayment.do")
public class verifyPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verifyPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imp_uid = request.getParameter("imp_uid");
		System.out.println("Received imp_uid: " + imp_uid); 
		
		if (imp_uid == null || imp_uid.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Missing imp_uid parameter.");
            return;
        }
		
        PortOneAPI portOneAPI = new PortOneAPI();
        String token = portOneAPI.getAccessToken();

        if (token != null) {
            boolean isPaymentValid = verifyPayment(token, imp_uid);
            if (isPaymentValid) {
                response.getWriter().write("Payment verified successfully.");

                // 결제가 성공적으로 검증되면 주문 정보를 포트원 관리자 페이지에 전송합니다.
                boolean isOrderSent = sendOrderInfoToPortOne(token, imp_uid);
                if (isOrderSent) {
                    response.getWriter().write(" Order information sent to PortOne successfully.");
                } else {
                    response.getWriter().write(" Failed to send order information to PortOne.");
                }
            } else {
                response.getWriter().write("Payment verification failed.");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Failed to get access token.");
        }
    }
	private boolean verifyPayment(String token, String imp_uid) {
        try {
            URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + token);

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                br.close();

                JSONParser parser = new JSONParser();
                JSONObject jsonResponse = (JSONObject) parser.parse(response.toString());
                JSONObject responseObj = (JSONObject) jsonResponse.get("response");
                int amount = ((Long) responseObj.get("amount")).intValue();

                return amount == 10000; // 실제 주문 금액을 사용해야 합니다.
            } else {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                StringBuilder errorResponse = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    errorResponse.append(line);
                }
                br.close();
                System.out.println("Error response: " + errorResponse.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	private boolean sendOrderInfoToPortOne(String token, String imp_uid) {
        try {
            URL url = new URL("https://api.iamport.kr/payments/" + imp_uid); // 포트원 관리자 페이지 API URL
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + token);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            JSONObject orderInfo = new JSONObject();
            orderInfo.put("imp_uid", imp_uid);
            orderInfo.put("merchant_uid", "merchant_" + System.currentTimeMillis());
            orderInfo.put("name", "주문명: 와인");
            orderInfo.put("amount", 10000);
            orderInfo.put("buyer_email", "buyer@example.com");
            orderInfo.put("buyer_name", "홍길동");
            orderInfo.put("buyer_tel", "010-1234-5678");
            orderInfo.put("buyer_addr", "서울특별시 강남구 삼성동");
            orderInfo.put("buyer_postcode", "123-456");

            OutputStream os = conn.getOutputStream();
            os.write(orderInfo.toString().getBytes());
            os.flush();
            os.close();

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    response.append(line);
                }
                br.close();

                System.out.println("Order information sent successfully: " + response.toString());
                return true;
            } else {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                StringBuilder errorResponse = new StringBuilder();
                String line;
                while ((line = br.readLine()) != null) {
                    errorResponse.append(line);
                }
                br.close();
                System.out.println("Error response: " + errorResponse.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
//class PortOneAPI {
//
//    private static final String IMP_KEY = "your_imp_key"; // 발급받은 REST API 키 (임의의 데이터)
//    private static final String IMP_SECRET = "your_imp_secret"; // 발급받은 REST API Secret (임의의 데이터)
//
//    public String getAccessToken() {
//        try {
//            URL url = new URL("https://api.iamport.kr/users/getToken");
//            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//            conn.setRequestMethod("POST");
//            conn.setRequestProperty("Content-Type", "application/json");
//            conn.setDoOutput(true);
//
//            String params = "{\"imp_key\":\"" + IMP_KEY + "\",\"imp_secret\":\"" + IMP_SECRET + "\"}";
//            OutputStream os = conn.getOutputStream();
//            os.write(params.getBytes());
//            os.flush();
//            os.close();
//
//            int responseCode = conn.getResponseCode();
//            if (responseCode == 200) {
//                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//                StringBuilder response = new StringBuilder();
//                String line;
//                while ((line = br.readLine()) != null) {
//                    response.append(line);
//                }
//                br.close();
//
//                JSONParser parser = new JSONParser();
//                JSONObject jsonResponse = (JSONObject) parser.parse(response.toString());
//                JSONObject responseObj = (JSONObject) jsonResponse.get("response");
//                return (String) responseObj.get("access_token");
//            } else {
//                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//                StringBuilder errorResponse = new StringBuilder();
//                String line;
//                while ((line = br.readLine()) != null) {
//                    errorResponse.append(line);
//                }
//                br.close();
//                System.out.println("Error response: " + errorResponse.toString());
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//}
