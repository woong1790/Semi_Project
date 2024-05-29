package com.nbp.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailSendServlet
 */
//@WebServlet("/common/emailSend.do")
//@WebServlet(urlPatterns= {"/common/emailSend.do","/common/emailSender.do"})
public class EmailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String FindId=request.getParameter("findemail");
		String FindPassword=request.getParameter("email");
		String EnrollEmail=request.getParameter("useremail");
//		if(findemail!=null) 
		Random random = new Random();
        int sixDigitNumber = random.nextInt(1000000); // 0부터 999999까지의 난수 생성
        String formattedNumber = String.format("%06d", sixDigitNumber);
//        System.out.println("6자리 난수: " + formattedNumber);

		// 사용자 인증 이메일 발송 내용
			String host = "smtp.gmail.com";
			String from = "a.whale.0523@gmail.com";
			String to="";
			if(EnrollEmail!=null) {
				to = EnrollEmail;
			}else if(FindPassword!=null) {
				to = FindPassword;
				}else if(FindId!=null){
					to = FindId;
				}
			 //emailAuthen.jsp에서 받아와야함
			String subject = "이메일 인증 번호"; 
			String content = "해당 인증번호로 이메일 인증을 진행해주세요.("+formattedNumber+")";
			Pattern pattern = Pattern.compile("\\(\\d{6}\\)");
		    Matcher matcher = pattern.matcher(content);
		    String extractedNumber = "";
	        if (matcher.find()) {
	            extractedNumber = matcher.group();
	            extractedNumber = extractedNumber.substring(1, extractedNumber.length() - 1); // 괄호 제거
	        }
	        String AuthNum=extractedNumber;
			
			
			// 이메일 전송 : SMTP 이용을 위함
			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", host); // google SMTP 주소
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			p.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
			p.put("mail.smtp.ssl.enable", "true");  // 추가된 코드


			try{
				Authenticator auth = new Gmail();
			    Session ses = Session.getInstance(p, auth);
			    ses.setDebug(true);
			    MimeMessage msg = new MimeMessage(ses); 
			    msg.setSubject(subject);		// 메일 제목
			    Address fromAddr = new InternetAddress(from); 	// 보내는 사람 정보
			    msg.setFrom(fromAddr);
			    Address toAddr = new InternetAddress(to);	
			    		// 받는 사람 정보
			    msg.addRecipient(Message.RecipientType.TO, toAddr);
			    msg.setContent(content, "text/html;charset=UTF-8");
			    Transport.send(msg); // 메세지 전송
			}catch(Exception e){
				e.printStackTrace();
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('메일 전송 중 오류가 발생했습니다.');");
				script.println("history.back();"); 
				script.println("</script>");
				script.close();
			}
			
//			request.setAttribute("AuthNum",AuthNum);
//			request.getRequestDispatcher("/WEB-INF/common/emailAuthen.jsp").forward(request, response);
			response.getWriter().write(AuthNum);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
