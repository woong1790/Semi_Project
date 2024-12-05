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
@WebServlet("/product/pagebar.do")
public class ProductListMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				//현재페이지저장
				int cPage=1;
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {}
				//페이지당 데이터수 저장
				int numPerpage=6;
				try {
					numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
				}catch(NumberFormatException e) {}
				//board 리스트 값들고오기
				List<Product> products = new ProductService().selectProductAll(cPage, numPerpage);
				//request에 값 저장 >>jsp에서 쓰기 위함
				request.setAttribute("products1", products);

				String pageBar="";

					pageBar="<div id='all-read-btn' class='read-btn'><p>read-More</p></div>";
					


				request.setAttribute("pageBar", pageBar);
				request.getRequestDispatcher("/WEB-INF/views/product/ProductList.jsp").forward(request, response);
				
				
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
