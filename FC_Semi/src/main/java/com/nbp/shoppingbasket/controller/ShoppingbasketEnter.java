package com.nbp.shoppingbasket.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbp.model.DTO.Member;
import com.nbp.product.model.DTO.Product;
import com.nbp.product.model.service.ProductService;
import com.nbp.shoppingbasket.model.dto.ShoppingBasketDto;
import com.nbp.shoppingbasket.model.service.ShoppingbasketService;

/**
 * Servlet implementation class ShoppingbasketEnter
 */
@WebServlet("/shoppingbasket/ShoppingBasket.do")
public class ShoppingbasketEnter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingbasketEnter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		Member loginMember=(Member)session.getAttribute("loginMember"); 
		String userId=loginMember.getMemberId();
		
		List<ShoppingBasketDto> list =new ShoppingbasketService().searchAllBasket(userId);
		
		request.setAttribute("shoppingbasketlist", list);
		
		
		List<Product> productlist=new ProductService().selectProductAll(1, 15);
		
		request.setAttribute("productlist", productlist);
		
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/ShoppingBasket.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
