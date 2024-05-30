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

/**
 * Servlet implementation class KakaoPaymentServlet
 */
@WebServlet("/pay/paymentmethod.do")
public class KakaoPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ADMIN_KEY = "DEVEDA269EB5B668BE4C39B52369888B99718BED";
    private static final String READY_URL = "https://open-api.kakaopay.com/online/v1/payment/ready";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpURLConnection connection = null;

        try {
            // 클라이언트로부터 받은 JSON 데이터를 읽기
            StringBuilder jsonBody = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBody.append(line);
                }
            }

            URL url = new URL(READY_URL);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Authorization", "SECRET_KEY " + ADMIN_KEY);
            connection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
            connection.setDoOutput(true);

            // 요청 데이터 설정
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonBody.toString().getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int responseCode = connection.getResponseCode();
            String responseMessage = connection.getResponseMessage();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
                    StringBuilder responseBody = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        responseBody.append(responseLine.trim());
                    }

                    // 클라이언트에게 응답 전송
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(responseBody.toString());
                }
            } else {
                // 오류 발생 시 응답 코드와 메시지 전송
                response.setStatus(responseCode);
                response.getWriter().write("{\"error\":\"" + responseMessage + "\"}");
            }
        } catch (Exception e) {
            // 서버 오류 발생 시 응답 코드와 메시지 전송
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

}
