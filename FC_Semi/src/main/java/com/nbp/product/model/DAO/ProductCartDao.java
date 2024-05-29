package com.nbp.product.model.DAO;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.nbp.common.JDBCTemplate.*;

import com.fasterxml.jackson.databind.JsonNode;

public class ProductCartDao {
	
	private Properties sql = new Properties();
	{
		String path = ProductDao.class.getResource("/sql/product/productCart.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertCart(Connection conn, String memberId, String productId,String cartVolume,String optionName,String optionPrice) {
		PreparedStatement pstmt = null;
		int result =0;
		try {
		pstmt = conn.prepareStatement(sql.getProperty("insertCart"));
		pstmt.setString(1,memberId);
		pstmt.setInt(2,Integer.parseInt(productId));
		pstmt.setInt(3,Integer.parseInt(cartVolume));
		pstmt.setString(4,optionName);
		pstmt.setString(5,optionPrice);
		result=pstmt.executeUpdate();
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
