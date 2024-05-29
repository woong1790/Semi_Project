package com.nbp.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.notice.model.dto.Notice;
import com.nbp.notice.model.service.NoticeService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeWriteEndServlet
 */
@WebServlet("/notice/noticewriteend.do")
public class NoticeWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=getServletContext().getRealPath("/upload/notice");//getRealPath("/")하면 wepapp위치가 잡힌다
		System.out.println(path);
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		//인코딩 
		String encode="UTF-8";
		
		//파일크기
		int maxSize=1024*1024*50; //10메가바이트
		
		//리네임
		DefaultFileRenamePolicy dfrp=new DefaultFileRenamePolicy();
		
		MultipartRequest mr = new MultipartRequest(
				request,path,maxSize,encode,dfrp);
		
		//나머지 정보를 가져오기
		String title= mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content= mr.getParameter("content");
		
		//업로드된 파일정보 (리네임되 명칭을 저장되어있게 하고 사용자가 저장한 이름과 매칭되게 가져오게 하기)
		//원본파일명
		String oriname=mr.getOriginalFileName("upfile");
		//리네임파일명
		String rename= mr.getFilesystemName("upfile");
		System.out.println(title+" "+writer+" "+content+" "+oriname+" "+rename);
		
		Notice n = Notice.builder()
				.noticeTitle(title)
				.noticeWriter(writer)
				.noticeContent(content)
				.filePath(rename)
				.build();
		int result = new NoticeService().insertNotice(n);
		String msg,loc;
		if(result>0) {
			msg="공지사항등록 성공";
			loc="/notice/noticelist.do";
		}else {
			msg="공지사항 등록 실패";
			loc="/notice/noticewrite.do";
			

			File delFile= new File(path+"/"+rename);
			if(delFile.exists()) delFile.delete();

		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
