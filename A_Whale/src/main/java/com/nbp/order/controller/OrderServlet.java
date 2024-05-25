package com.nbp.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.notice.model.service.NoticeService;
import com.nbp.order.model.dto.Order;
import com.nbp.order.model.service.OrderService;
import com.nbp.product.model.DTO.Product;
import com.nbp.product.model.service.ProductService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order/orderpage.do")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String productName =request.getParameter("productName");
//		int productCount= Integer.parseInt(request.getParameter("productCount"));
//		int totalPrice= Integer.parseInt(request.getParameter("totalPrice"));
//		String optionName= request.getParameter("optionName");
//		int optionPrice= Integer.parseInt(request.getParameter("optionPrice"));
//
//		System.out.println(productName);
//		System.out.println(productCount);
//		System.out.println(totalPrice);
//		System.out.println(optionName);
//		System.out.println(optionPrice);
//		System.out.println();
		
		
		
		
		
		
		
		
		int cPage=1;

		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));

		}catch(NumberFormatException e) {}
		
		int numPerpage=3;
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));			
		}catch(NumberFormatException e) {}
		
		List<Order> orders=new OrderService().selectOrderAll(cPage,numPerpage);
		request.setAttribute("orders",orders);
		
		List<Product> products = new ProductService().selectProductAll(cPage,numPerpage);
		request.setAttribute("products", products);
		
		
		int totalData=new NoticeService().selectNoticeCount();
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1; 
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="<ul class='pagination '>";
		if(pageNo==1) { //1번페이지면 이전버튼 작동하지 않게
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		}else { //2번페이지면 이전번튼 작동하게
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"+request.getRequestURI()
			+"?cPage="+(pageNo-1)+"&numPerpage="+numPerpage+"'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='"+request.getRequestURI()
							+"?cPage="+(pageNo)+"&numPerpage="+numPerpage+"'>"
							+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"+request.getRequestURI()
						+"?cPage="+(pageNo)+"&numPerpage="+numPerpage+"'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		request.setAttribute("pageBar",pageBar);
		
		
		
		
//		Order order = new Order();
//		order.setOrderId(request.getParameter("orderId"));
//		order.setMemberId(request.getParameter("memberId"));
//		order.setOrderName(request.getParameter("orderName"));
//	    request.setAttribute("orders", orders);
	    request.getRequestDispatcher("/WEB-INF/views/order/order.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
