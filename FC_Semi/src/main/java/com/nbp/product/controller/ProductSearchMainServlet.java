package com.nbp.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.product.model.DTO.Product;
import com.nbp.product.model.service.ProductService;

/**
 * Servlet implementation class ProductSearchServlet
 */
@WebServlet("/product/searchproduct.do")
public class ProductSearchMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Cookie cookie1 = new Cookie("title", "");
//		cookie1.setMaxAge(0);
//		response.addCookie(cookie1);
//		Cookie cookie2 = new Cookie("subtitle", "");
//		cookie2.setMaxAge(0);
//		response.addCookie(cookie2);
			
		
		String title = request.getParameter("title");
		String subtitle = request.getParameter("subtitle");
		int firstNo=1;
		int lastNo=6;
		System.out.println(title);
		System.out.println(subtitle);
		
		Cookie cookie1 = new Cookie("title", title);
	    cookie1.setMaxAge(60 * 60 * 6);
	    response.addCookie(cookie1);
	
	    Cookie cookie2 = new Cookie("subtitle", subtitle);
	    cookie2.setMaxAge(60 * 60 * 6);
	    response.addCookie(cookie2);
		
		request.setAttribute("title2", title);
		request.setAttribute("subtitle2", subtitle);

	List<Product> result = new ProductService().searchProduct(title,subtitle,firstNo,lastNo);
	request.setAttribute("searchProduct",result);
	
	String pageBar="";
//	request.getContentType()
	/* pageBar="<div><button onclick='searchBtn();'>searchBtn</button></div>"; */
//	pageBar="<div id='all-read-btn' class='read-btn' style='bolder:1px solid red'><p>prodict-read-More</p></div>";
//	request.setAttribute("searchpageBar", pageBar);
	
	request.getRequestDispatcher("/WEB-INF/views/product/SearchProduct.jsp").forward(request, response);
	
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
