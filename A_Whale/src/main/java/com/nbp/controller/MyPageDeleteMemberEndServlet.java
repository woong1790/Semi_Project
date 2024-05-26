package com.nbp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nbp.model.DTO.Member;
import com.nbp.model.service.MemberService;

/**
 * Servlet implementation class MyPageDeleteMemberEndServlet
 */
@WebServlet("/MyPage/deleteMember.do")
public class MyPageDeleteMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageDeleteMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService ms=new MemberService();
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
		Member loginMember=(Member)session.getAttribute("loginMember");
		String userId=loginMember.getMemberId();
		String userPw=loginMember.getMemberPw();
		String msg="",loc="";
		if(password.equals("")) {
			request.setAttribute("msg", "패스워드를 입력하세요");
			request.setAttribute("loc", "/");
			RequestDispatcher rd=request
					.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
		}else if(password.equals(userPw)){
			System.out.println(userPw);
			int result=ms.deleteMember(userId);
			if(result>0) {
				msg="회원탈퇴가 완료되었습니다. :)";
				loc="/";
				session.invalidate();
			}else {
				msg="회원탈퇴 실패, 비밀번호 재확인 필요. :( ";
				loc="/";
			}
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
		.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
