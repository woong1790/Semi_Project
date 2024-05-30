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


        

        String productName = (String)request.getParameter("productName");
        int productCount = Integer.parseInt(request.getParameter("productCount")) ;
        int productPrice = Integer.parseInt(request.getParameter("productPrice"));
        int totalPrice = Integer.parseInt(request.getParameter("totalprice"));
        String optionName = (String)request.getParameter("optionName");
        String productImage = request.getParameter("productImg");
        
//        String point = request.getParameter("point");
//        String point2 = (String)(point*0.01);
//        String options = request.getParameter("options");
//        String productPrice = request.getParameter("productPrice");
        System.out.println("productName "+productName);
        System.out.println("productCount "+productCount);
        System.out.println("totalPrice "+totalPrice);
        System.out.println("productImage "+productImage);
        // 요청에 속성으로 데이터를 설정
        request.setAttribute("productName", productName);
        request.setAttribute("productCount", productCount);
        request.setAttribute("productPrice", productPrice);
        request.setAttribute("optionName", optionName);

        request.setAttribute("totalPrice", totalPrice);
//        request.setAttribute("point2",point2);
        request.setAttribute("productImage", productImage);
//        request.setAttribute("productPrice", productPrice);
//        request.setAttribute("options", options);
	    
	    
	 
//      if (productName == null || productCount == null || totalPrice == null) {
//          response.sendError(HttpServletResponse.SC_BAD_REQUEST, "필수 데이터가 누락되었습니다.");
//          return;
//      }
  
      request.getRequestDispatcher("/WEB-INF/views/order/order.jsp")
      .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				doGet(request, response);
    }
	
}