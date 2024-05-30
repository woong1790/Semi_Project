package com.nbp.product.model.service;

import static com.nbp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.nbp.product.model.DAO.ProductWishlistDao;

public class ProductWishlistService {

	private ProductWishlistDao dao = new ProductWishlistDao();
	
	public int insertWishlist(int productId, String memberId) {
		Connection conn = getConnection();
		int result = dao.insertWishlist(conn, productId, memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int checkWishlist(int productId, String memberId) {
		Connection conn = getConnection();
		int result = dao.checkWishlist(conn, productId, memberId);
		close(conn);
		return result;
	}
	
	public int deleteWishlist(int productId, String memberId) {
		Connection conn = getConnection();
		int result = dao.deleteWishlist(conn, productId, memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
