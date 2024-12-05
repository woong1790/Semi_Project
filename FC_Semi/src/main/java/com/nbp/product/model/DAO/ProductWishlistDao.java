package com.nbp.product.model.DAO;

import static com.nbp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class ProductWishlistDao {

	private Properties sql = new Properties();
	
	{
		String path = ProductDao.class.getResource("/sql/product/productWish.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}

	}
	
		public int insertWishlist(Connection conn, int productId, String memberId) {
			PreparedStatement pstmt = null; 
			int result = 0 ;
			try {
			pstmt = conn.prepareStatement(sql.getProperty("insertwishlist"));
			pstmt.setInt(1, productId);
			pstmt.setString(2, memberId);
			result = pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
			
		}
		
		public int checkWishlist(Connection conn, int productId, String memberId) {
			PreparedStatement pstmt = null; 
			ResultSet rs = null;
			int result = 0 ;
			try {
			pstmt = conn.prepareStatement(sql.getProperty("checkwishlist"));
			pstmt.setInt(1, productId);
			pstmt.setString(2, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return result;
		}
		
		
		public int deleteWishlist(Connection conn, int productId, String memberId) {
			PreparedStatement pstmt = null; 
			int result = 0 ;
			try {
			pstmt = conn.prepareStatement(sql.getProperty("deletewishlist"));
			pstmt.setInt(1, productId);
			pstmt.setString(2, memberId);
			result = pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}
	}
	

