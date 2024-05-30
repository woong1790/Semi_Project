package com.nbp.cart.model.DAO;

import static com.nbp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.nbp.cart.model.DTO.Cart;

public class CartDAO {
	private Properties sql=new Properties();
	{
		String path=CartDAO.class
				.getResource("/sql/cart/cart.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<Cart> selectCartByMemberId(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Cart> carts=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectCartByMemberId"));
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				carts.add(getCart(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return carts;
	}
	
	public static Cart getCart(ResultSet rs) throws SQLException{
		return Cart.builder()
				.cartNo(rs.getInt("CART_NO"))
				.memberId(rs.getString("MEMBER_ID"))
				.productId(rs.getInt("PRODUCT_ID"))
				.productPrice(rs.getInt("PRODUCT_PRICE"))
				.cartVolume(rs.getInt("CART_VOLUME"))
				.optionName(rs.getString("OPTION_NAME"))
				.optionPrice(rs.getString("OPTION_PRICE"))
				.productName(rs.getString("PRODUCT_NAME"))
				.productImg(rs.getString("PRODUCT_IMG"))
				.build();
	}
	
}
