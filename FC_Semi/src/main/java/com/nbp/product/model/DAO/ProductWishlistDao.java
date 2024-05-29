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
	
		public int insertWishlist(Connection conn, String productId, String memberId) {
			PreparedStatement pstmt = null; 
			ResultSet rs = null;
			int result = 0 ;
			try {
			pstmt = conn.prepareStatement(sql.getProperty("insertwishlist"));
			pstmt.setString(1, productId);
			pstmt.setString(2, memberId);
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return result;
			
		}
	}
	

