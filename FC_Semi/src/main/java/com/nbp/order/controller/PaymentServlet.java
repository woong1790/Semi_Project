package com.nbp.order.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
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
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class KakaoPaymentServlet
 */
@WebServlet("/pay/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final String ADMIN_KEY = "0d104a33b76a855537cfd307e913c71c";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
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
		String cid = "TC0ONETIME"; // 테스트용 cid
        String partner_order_id = "partner_order_id";
        String partner_user_id = "partner_user_id";
        String item_name = "Test Item";
        int quantity = 1;
        int total_amount = 1000;
        int tax_free_amount = 0;
        String approval_url = "http://localhost:9090/payment/success";
        String cancel_url = "http://localhost:9090/payment/cancel";
        String fail_url = "http://localhost:9090/payment/fail";

        URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "KakaoAK " + ADMIN_KEY);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        conn.setDoOutput(true);

        String params = String.format("cid=%s&partner_order_id=%s&partner_user_id=%s&item_name=%s&quantity=%d&total_amount=%d&tax_free_amount=%d&approval_url=%s&cancel_url=%s&fail_url=%s",
                cid, partner_order_id, partner_user_id, item_name, quantity, total_amount, tax_free_amount, approval_url, cancel_url, fail_url);

        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = params.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int code = conn.getResponseCode();
        if (code == 200) {
            try (InputStream is = conn.getInputStream()) {
                JSONParser parser = new JSONParser();
                JSONObject json = (JSONObject) parser.parse(new java.io.InputStreamReader(is, "utf-8"));
                String tid = (String) json.get("tid");
                String next_redirect_pc_url = (String) json.get("next_redirect_pc_url");

                response.sendRedirect(next_redirect_pc_url);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else {
            response.getWriter().write("Failed to connect to Kakao API");
        }
    }

}
