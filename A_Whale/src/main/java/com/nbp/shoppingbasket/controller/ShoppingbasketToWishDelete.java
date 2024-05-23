package com.nbp.shoppingbasket.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbp.model.DTO.Member;
import com.nbp.shoppingbasket.model.service.ShoppingbasketService;
import com.nbp.wishlist.model.dto.WishlistDto;
import com.nbp.wishlist.model.service.WishlistService;

/**
 * Servlet implementation class ShoppingbasketToWishDelete
 */
@WebServlet("/shoppingbasket/baskettowishdelete.do")
public class ShoppingbasketToWishDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingbasketToWishDelete() {
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
		 List<WishlistDto> wishList=new WishlistService().selectWishAll(userId);
		 List productidori=new ArrayList<>();
		 List errorduplication=new ArrayList<>();
		 for(int i=0; i<wishList.size(); i++) {
			 productidori.add(wishList.get(i).getProductId());
			 
		 }
		 System.out.println(productidori);
		 	String arr=request.getParameter("insertCartArr");
		 	String arr2=request.getParameter("insertProductArr");
			String[] list=arr.split(",");
			String[] list2=arr2.split(",");
			int[] cartinlist=new int[list.length];
			int[] cartproductinlist=new int[list.length];
			for(int i=0; i<list.length; i++) {
				cartinlist[i]=Integer.parseInt(list[i]);
				cartproductinlist[i]=Integer.parseInt(list2[i]);
			}
		List<Integer> deleteinlist=new ArrayList<>();
		 if(wishList.size()>=48) {
			request.setAttribute("msg","저장된 위시리스트 갯수가 48개를 초과하였습니다.");
			response.sendRedirect(request.getContextPath());
			
		 }else if((wishList.size())+(cartinlist.length)>48){
			 
			 request.setAttribute("msg","저장하려는 위시리스트의 갯수가 적절하지 않습니다. "+
					 (((wishList.size())+(cartinlist.length))-48)+"개 이하로만 체크해주세요");
			 response.sendRedirect(request.getContextPath());
		 }else {
			 System.out.println(cartinlist.length);
			 for(int i=0;i<cartinlist.length; i++) {
				 if(!productidori.contains(cartproductinlist[i])) {
				 WishlistDto s=new WishlistDto().builder()
						 .memberId(userId)
						 .productId(cartproductinlist[i])
						 .build();
				
				 new WishlistService().insertWish(s);
				 System.out.println("성공");
				 deleteinlist.add(cartproductinlist[i]);
				 }else {
					 for (WishlistDto s: wishList) {
						 if(s.getProductId()==cartproductinlist[i]) {
							 errorduplication.add(s.getProductName());
						 }
						 
					 }
				 }
				
				 
			 }
			 
			 if(!deleteinlist.isEmpty()) {
				 int[] deleteinlist2= deleteinlist.stream()
			                .mapToInt(i -> i)
			                .toArray();
				 System.out.println(Arrays.toString(deleteinlist2)+"인트배열 변환 성공?");
				 String path="";
					for(int i=0; i<deleteinlist2.length; i++) {
						if(i==0&&deleteinlist2.length==1) {
							path+="(?)";
						}else if(i==0) {
							path+="(?, ";
						}
						else if(i!=(deleteinlist2.length)-1){
							path+="?, ";
						}else if(i==(deleteinlist2.length)-1) {
							path+="?)";
						}
					}
					 System.out.println(path);
				 int result=new ShoppingbasketService().deleteBasket2(deleteinlist2, path);
				 if(result>0) {
					System.out.println("웨안됨");
				 }
				 }
			 
			 
			 if(!errorduplication.isEmpty()) {
			 request.setAttribute("errorduplication", errorduplication);
			 response.sendRedirect(request.getContextPath());
			 }else {
				request.getRequestDispatcher("/shoppingbasket/baskettowish.do").forward(request, response);
			 }
			 
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
