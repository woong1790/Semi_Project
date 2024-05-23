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
import com.nbp.shoppingbasket.model.dto.ShoppingBasketDto;
import com.nbp.shoppingbasket.model.service.ShoppingbasketService;

/**
 * Servlet implementation class ShoppingbasketToWishEnter
 */
@WebServlet("/shoppingbasket/baskettowishenter.do")
public class ShoppingbasketToWishEnter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingbasketToWishEnter() {
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
		
		String insertCartArr= request.getParameter("insertCartArr");
		String insertProductArr=request.getParameter("insertProductArr");
		
		
		request.setAttribute("insertCartArr", insertCartArr);
		request.setAttribute("insertProductArr", insertProductArr);
		
		request.getRequestDispatcher("/WEB-INF/common/BasketWishInsertAlert.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
