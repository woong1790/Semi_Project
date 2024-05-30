package com.nbp.order.controller;



import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;



/**
 * Servlet implementation class PaymentCompleteServlet
 */
@WebServlet("/order/productdetailorder.do")
public class PaymentCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json;charset=UTF-8");


	     
//      String productNames = request.getParameterValue("productName");
//      String quantities = request.getParameterValue("productCount");
//      String totalprice = request.getParameterValue("totalprice");
//      request.setAttribute("productNames", productNames);
//      request.setAttribute("quantities", quantities);
//      request.setAttribute("totalPrice", totalprice);
//      if (productNames == null || quantities == null || productPrices == null) {
//          response.sendError(HttpServletResponse.SC_BAD_REQUEST, "필수 데이터가 누락되었습니다.");
//          return;
//      }

      
      
//      request.setAttribute("productPrices", productPrices);
//      
//      
//      int totalPrice = 0;
//      for (int i = 0; i < productNames.length; i++) {
//          int quantity = Integer.parseInt(quantities[i]);
//          int price = Integer.parseInt(productPrices[i]);
//          totalPrice += price * quantity;
//      }
     
      request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    }
	
}