package com.nbp.wishlist.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.wishlist.model.dto.WishlistDto;
import com.nbp.wishlist.model.service.WishlistService;



/**
 * Servlet implementation class WishListEnterSer
 */
@WebServlet("/wishlist/WishListEnterSer.do")
public class WishListEnterSer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListEnterSer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage=0;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
			
		}catch (NumberFormatException e) {
			cPage=1;
		}		
		
		int numPerpage=8;
		
		
//		String userId=request.getParameter("userId");
		String userId=request.getParameter("memberid");
		System.out.println(userId+"깃에서의 첫 시스아웃");
		//pageBar만들기
		StringBuffer pageBar=new StringBuffer();
		int totalData=new WishlistService().selectWishCount(userId);
		request.setAttribute("totalData", totalData);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		if(totalPage<cPage) {
//			여러가지 방법이 있다고 한다.. 생각해보자.
//			url은 다 나옴 url는 쿼리스트림이 안들어감
			System.out.println(request.getRequestURI());
			request.setAttribute("prevPage", request.getRequestURI());
			
			
		}
		int pageBarSize=4;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
//		1.totalPage:전체 페이지 수를 저장
//	 	계산:totalData/numPerpage -> 나누기 결과를 무조건 올림 ceil();
//	 	
//	 	2.totalData:전체 데이터 수를 저장
//	 	계산:db row를 가져옴
//	 	
//	 	3.cPage:현재 페이지 내가 보는 페이지
//	 	계산:클라이언트가 보내준 데이터 
//		4.numPerPage:페이지당 데이터 수를 저장하는 것
//	 	계산:지정값 또는 클라이언트가 보낸 데이터
//	 	5.pageNo:pageBar의 시작번호
//	 	계산:((cPage-1)/pageBarSize)*pageBarSize+1 
//	 	6.pageEnd:pageBar의 마지막번호  
//	 	계산:pageNo+pageBarSize-1
//	 	7.pageBarSize:pageBar번호의 갯수
//	 	8.pageBar(String):생성된 pageBar html코드를 저장하는 변수 전체 
//	 
//	 	데이터의 시작번호 (cPage-1)*numPerPage+1
//		 데이터의 끝번호 cPage*numPerpage 
//	 	DB의 로우넘, 랭크와 함께 쓴다 
//		이거 집에서 한 번 더 쳐보기.. 
		//pageBar html
	
		
		while(!(pageNo>pageEnd||(pageNo>totalPage))) {
			if(pageNo==cPage) {
				pageBar.append("<span>"+pageNo+"</span>");
			}else {
				pageBar.append("<a href='"+request.getRequestURI()+
						"?cPage="+(pageNo)+"&memberid="+userId+"'>"+pageNo+"</a>");
			}
			pageNo++;
		}
		
	
		
		System.out.println(request.getRequestURI()+"uri");
		System.out.println(request.getContextPath()+"contextpath");
		request.setAttribute("pageBar", pageBar);
		
		List<WishlistDto> list=new WishlistService().searchAllWish(userId,cPage,numPerpage);
		System.out.println(list);
		request.setAttribute("wishlist", list);
		request.getRequestDispatcher("/WEB-INF/views/mypage/WishList.jsp").forward(request, response);
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
