package com.nbp.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.nbp.model.DTO.Member;

/**
 * Servlet Filter implementation class ZCheckAuthenticateFilter
 */
@WebFilter("/admin/*")
public class ZCheckAuthenticateFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public ZCheckAuthenticateFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest)request;
		HttpSession session = hrequest.getSession();
		Member loginMember=	(Member)session.getAttribute("loginMember");
		
		if(loginMember!=null && loginMember.getMemberId().equals("ADMIN")) {
			chain.doFilter(request,response);
		}else {
//			request.setAttribute("prevPage", hrequest.getContextPath());
//			throw new MyPageError("접근권한이 없습니다");
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
