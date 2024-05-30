package com.nbp.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.admin.service.AdminService;
import com.nbp.product.model.DTO.Product;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class adminInsertProductServlet
 */
@WebServlet("/product/productinsertend.do")
public class adminInsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminInsertProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String encode="UTF-8";
		
		String uploadPath=getServletContext().getRealPath("/")+"upload";//getRealPath("/")하면 wepapp위치가 잡힌다
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) uploadDir.mkdirs();
		
		//파일크기
		int maxSize=1024*1024*100; 
		
		//리네임
		DefaultFileRenamePolicy dfrp=new DefaultFileRenamePolicy();
		
		MultipartRequest mr = new MultipartRequest(request,uploadPath,maxSize,encode,dfrp);
		
		//폼으로 보낸거 가져오는거
		request.setCharacterEncoding("UTF-8");
        String productName = mr.getParameter("productName");
        String productSubname = mr.getParameter("productSubname");
        String productDetail = mr.getParameter("productDetail");
        int productPrice = Integer.parseInt(mr.getParameter("productPrice"));
        int productStock = Integer.parseInt(mr.getParameter("productStock"));
        int productAlcoholLv = Integer.parseInt(mr.getParameter("productAlcoholLv"));
        String productOrigin = mr.getParameter("productOrigin");
        int productVolume = Integer.parseInt(mr.getParameter("productVolume"));
        int productAge = Integer.parseInt(mr.getParameter("productAge"));
        String productBrand = mr.getParameter("productBrand");
        String productImg = mr.getFilesystemName("productImg");
        String categoryName = mr.getParameter("categoryName");
	
		
		////
		Enumeration<String> files = mr.getFileNames();
        while (files.hasMoreElements()) {
            String name = files.nextElement();
            productImg = mr.getFilesystemName(name);
        }
		
		Product product = new Product();
//		product.setProductNo(productNo);
		product.setProductName(productName);
		product.setProductSubname(productSubname);
		product.setProductDetail(productDetail);
		product.setProductPrice(productPrice);
		product.setProductStock(productStock);
		product.setProductAlcoholLv(productAlcoholLv);
		product.setProductOrigin(productOrigin);
		product.setProductVolume(productVolume);
		product.setProductAge(productAge);
		product.setProductBrand(productBrand);
		
		product.setCategoryName(categoryName);
		product.setProductImg(productImg); 
        
        
        int result = new AdminService().insertProduct(product);
        
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/product/productInfo.do?no=" + product.getProductNo());
        } else {

            request.setAttribute("msg", "상품 등록 실패");
            request.setAttribute("loc", "/admin/adminpage.do");
            request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
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
