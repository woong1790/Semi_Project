package com.nbp.shoppingbasket.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.shoppingbasket.model.service.ShoppingbasketService;


/**
 * Servlet implementation class SshoppingbasketDelete
 */
@WebServlet("/shoppingbasket/deletebasket.do")
public class ShoppingbasketDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingbasketDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String arr=request.getParameter("deleteArr");
		System.out.println(arr.length());
		String[] list=arr.split(",");
		int[] inlist=new int[list.length];
		for(int i=0; i<list.length; i++) {
			inlist[i]=Integer.parseInt(list[i]);
		}
		String path="";
		for(int i=0; i<inlist.length; i++) {
			if(i==0&&inlist.length==1) {
				path+="(?)";
			}else if(i==0) {
				path+="(?, ";
			}
			else if(i!=(inlist.length)-1){
				path+="?, ";
			}else if(i==(inlist.length)-1) {
				path+="?)";
			}
		}
		int result=new ShoppingbasketService().deleteBasket(inlist, path);
		
		if(result>0) {
			System.out.println("성공");
			response.sendRedirect(request.getContextPath()+"/shoppingbasket/ShoppingBasket.do");
		}else {
			System.out.println("실패");
		}
		
		
		System.out.println(result);
		System.out.println(Arrays.toString(inlist));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
