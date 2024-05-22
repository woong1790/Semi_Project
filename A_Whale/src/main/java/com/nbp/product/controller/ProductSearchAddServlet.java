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
 * Servlet implementation class ProductSearchAddServlet
 */
@WebServlet("/product/searchproductlist.do")
public class ProductSearchAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int searchfirstNo = Integer.parseInt(request.getParameter("searchfirstNo"));
		String title = request.getParameter("title");
		String subtitle = request.getParameter("subtitle");
		System.out.println(title+subtitle);
		List<Product> result = new ProductService().searchProduct(title,subtitle, searchfirstNo, (searchfirstNo+5));
	
		request.setAttribute("searchProducts", result);
		request.getRequestDispatcher("/WEB-INF/views/product/ajaxSearchProductList.jsp").forward(request, response);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
