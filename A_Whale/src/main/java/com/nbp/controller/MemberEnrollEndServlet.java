package com.nbp.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet("/common/enroll.do")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디, 닉네임, 등급(null), 비밀번호, 이름, 전화번호, 이메일, 주소, 주민번호, 포인트(null), 가입날짜(default)
		String userId=request.getParameter("userid");
		String userNickName=request.getParameter("usernickname");
		String userName=request.getParameter("username");
		String userPhone=request.getParameter("phone");
		String userEmail=request.getParameter("email");
		String userAdr=request.getParameter("address");
		String userIDNum=request.getParameter("birthdate");
//		LocalDate enrollDate=request.getParameter("");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
