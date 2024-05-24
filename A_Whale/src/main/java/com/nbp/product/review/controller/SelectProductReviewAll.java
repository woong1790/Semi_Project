package com.nbp.product.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.product.review.model.DTO.Review;
import com.nbp.product.review.model.service.ProductReviewService;

/**
 * Servlet implementation class SelectProductReviewAll
 */
@WebServlet("/product/reviewall.do")
public class SelectProductReviewAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectProductReviewAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//현재페이지 저장
		int cPage = 1;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {}
		//페이지당 데이터 갯수 지정
		int numPerpage = 5;
		try {
			numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {}
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		List<Review> reviews = new ProductReviewService().selectProductReviewAll(cPage, numPerpage, productNo);
		
		request.setAttribute("reviews", reviews);
		
		int totalData = new ProductReviewService().selectProductReviewAllCount();
		
		
		
		
	
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
