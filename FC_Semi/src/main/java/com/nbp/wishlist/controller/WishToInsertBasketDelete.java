package com.nbp.wishlist.controller;

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
import com.nbp.shoppingbasket.model.dto.ShoppingBasketDto;
import com.nbp.shoppingbasket.model.service.ShoppingbasketService;
import com.nbp.wishlist.model.service.WishlistService;

/**
 * Servlet implementation class WishToInsertBasketDelete
 */
@WebServlet("/wishlist/insertbasketdelete.do")
public class WishToInsertBasketDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishToInsertBasketDelete() {
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
		System.out.println(userId+"    들어왔는지?");
		 List<ShoppingBasketDto> cartList=new ShoppingbasketService().selectCartAll(userId);
		 List productidori=new ArrayList<>();
		 List errorduplication=new ArrayList<>();
		 for(int i=0; i<cartList.size(); i++) {
			 productidori.add(cartList.get(i).getProductId());
			 
		 }
		 System.out.println(productidori);
			String arr=request.getParameter("baskets");
			String[] list=arr.split(",");
			int[] inlist=new int[list.length];
			for(int i=0; i<list.length; i++) {
				inlist[i]=Integer.parseInt(list[i]);
			}
		 List<Integer> deleteinlist=new ArrayList<>(); 
		 
 		 if(cartList.size()>=5) {
			request.setAttribute("msg","저장된 장바구니 갯수가 5개를 초과하였습니다.");
			response.sendRedirect(request.getContextPath());
			
		 }else if((cartList.size())+(inlist.length)>5){
			 
			 request.setAttribute("msg","저장하려는 장바구니의 갯수가 적절하지 않습니다. "+
					 (((cartList.size())+(inlist.length))-5)+"개 이하로만 체크해주세요");
			 response.sendRedirect(request.getContextPath());
		 }else {
			 System.out.println(inlist.length);
			 for(int i=0;i<inlist.length; i++) {
				 if(!productidori.contains(inlist[i])) {
				 ShoppingBasketDto s=new ShoppingBasketDto().builder()
						 .memberId(userId)
						 .productId(inlist[i])
						 .cartVolume(1)
						 .build();
				
				 new ShoppingbasketService().insertCart(s);
				 deleteinlist.add(inlist[i]);
				 System.out.println("성공+삭제성공");
				 }else {
					 for (ShoppingBasketDto s: cartList) {
						 if(s.getProductId()==inlist[i]) {
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
			 int result=new WishlistService().deleteWish2(deleteinlist2, path);
			 if(result>0) {
				System.out.println("웨안됨");
			 }
			 }
			 
			 if(!errorduplication.isEmpty()) {
			 
			 request.setAttribute("errorduplication", errorduplication);
			 response.sendRedirect(request.getContextPath());
			 }else {
				request.getRequestDispatcher("/wishlist/WishListEnterSer.do").forward(request, response);
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
