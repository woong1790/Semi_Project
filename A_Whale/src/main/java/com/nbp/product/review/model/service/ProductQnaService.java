package com.nbp.product.review.model.service;

import static com.nbp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.nbp.product.review.model.DAO.ProductQnaDao;
import com.nbp.product.review.model.DTO.Qna;

public class ProductQnaService {
	
	private ProductQnaDao dao = new ProductQnaDao();
	
	public List<Qna> selectProductQnaAll(int cPage, int numPerpage, String productName){
		Connection conn = getConnection();
		List<Qna> result = dao.selectProductQnaAll(conn, cPage, numPerpage, productName);
		return result;
	}
	
	public int selectProductQnaAllCount(String productName) {
		Connection conn = getConnection();
		int result = dao.selectProductQnaAllCount(conn, productName);
		return result;
	}
}
