package com.nbp.admin.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbp.common.JDBCTemplate;
import com.nbp.product.model.DTO.Product;

/**
 * Servlet implementation class AdminInsertProductServlet
 */
@WebServlet("/admin/adminproduct.do")
public class AdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Connection conn = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        ArrayList<Product> products = new ArrayList<>();
//
//        try {
//            conn = JDBCTemplate.getConnection();
//
//            // SQL 쿼리 실행
//            String sql = "SELECT * FROM PRODUCT";
//            pstmt = conn.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//
//            // 결과를 리스트에 저장
//            while (rs.next()) {
//                int productNo = rs.getInt("productNo");
//                String productName = rs.getString("productName");
//                String productSubname = rs.getString("productSubname");
//                String productDetail = rs.getString("productDetail");
//                int productPrice = rs.getInt("productPrice");
//                int productStock = rs.getInt("productStock");
//                int productAlcoholLv = rs.getInt("productAlcoholLv");
//                String productOrigin = rs.getString("productOrigin");
//                int productVolume = rs.getInt("productVolume");
//                int productAge = rs.getInt("productAge");
//                String productBrand = rs.getString("productBrand");
//                Date productEnrollDate = rs.getDate("productEnrollDate");
//                int productDeleteYn = rs.getInt("productDeleteYn");
//                String memberId = rs.getString("memberId");
//                String productImg = rs.getString("productImg");
//                String categoryName = rs.getString("categoryName");
//
//                products.add(new Product(productNo, productName, productSubname, productDetail, productPrice,
//                                         productStock, productAlcoholLv, productOrigin, productVolume, productAge,
//                                         productBrand, productEnrollDate, productDeleteYn, memberId, productImg,
//                                         categoryName));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            JDBCTemplate.close(rs);
//            JDBCTemplate.close(pstmt);
//            // Connection은 닫지 않습니다. 싱글톤 패턴을 사용하고 있기 때문입니다.
//        }

        // 요청 속성에 상품 목록을 추가
//        request.setAttribute("products", products);

        // JSP로 요청 전달
        request.getRequestDispatcher("/WEB-INF/views/admin/adminProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
