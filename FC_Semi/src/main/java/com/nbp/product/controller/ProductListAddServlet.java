package com.nbp.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.product.model.DTO.Product;
import com.nbp.product.model.service.ProductService;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/product/productlist.do")
public class ProductListAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int firstNo = Integer.parseInt(request.getParameter("firstNo"));
//		System.out.println(firstNo);
		List<Product> result = new ProductService().selectProductAll(firstNo, (firstNo+5));
		
		request.setAttribute("products", result);
		request.getRequestDispatcher("/WEB-INF/views/product/ajaxProductList.jsp").forward(request, response);
				
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
