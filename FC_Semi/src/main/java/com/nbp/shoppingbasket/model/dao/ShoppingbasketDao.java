package com.nbp.shoppingbasket.model.dao;

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

import com.nbp.shoppingbasket.model.dto.ShoppingBasketDto;
import com.nbp.wishlist.model.dao.WishlistDao;

public class ShoppingbasketDao {
private Properties sql=new Properties();
	
	{
		
		String path=WishlistDao.class.getResource("/sql/shoppingbasket/sql_shoppingbasket.properties").getPath();
		try(FileReader fr1=new FileReader(path)) {
			sql.load(fr1);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public List<ShoppingBasketDto> searchAllBasket(Connection conn, String userId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ShoppingBasketDto> list=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchAllBasket"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getBasket(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	
		
	}
	
	public int deleteBasket(Connection conn, int[] arr, String path) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			
			String semisql=this.sql.getProperty("deleteBasket");
			semisql=semisql.replace("#ARR", path);
			
			pstmt=conn.prepareStatement(semisql);
			System.out.println(arr.length);
			for (int i=1; i<arr.length+1; i++) {
				pstmt.setInt(i, arr[i-1]);
				System.out.println(i);
				System.out.println(arr[i-1]);
				
				
			}
			result=pstmt.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
		
		
	}
	
	public List<ShoppingBasketDto> selectCartAll(Connection conn, String userId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ShoppingBasketDto> list=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectCartAll"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getBasketOri(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	
		
	}
	
	public int insertCart(Connection conn, ShoppingBasketDto cart) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertCart"));
			pstmt.setString(1, cart.getMemberId());
			pstmt.setInt(2, cart.getProductId());
			pstmt.setInt(3, cart.getCartVolume());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int deleteBasket2(Connection conn, int[] arr, String path) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			
			String semisql=this.sql.getProperty("deleteBasket2");
			semisql=semisql.replace("#ARR", path);
			
			pstmt=conn.prepareStatement(semisql);
			System.out.println(arr.length);
			for (int i=1; i<arr.length+1; i++) {
				pstmt.setInt(i, arr[i-1]);
				System.out.println(i);
				System.out.println(arr[i-1]);
				
				
			}
			result=pstmt.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		return result;
		
		
	}
	
	public static ShoppingBasketDto getBasket(ResultSet rs) throws SQLException{
		
		return ShoppingBasketDto.builder()
				.cartNo(rs.getInt("CART_NO"))
				.memberId(rs.getString("MEMBER_ID"))
				.productId(rs.getInt("PRODUCT_ID"))
				.cartVolume(rs.getInt("CART_VOLUME"))
				.productprice(rs.getInt("PRODUCT_PRICE"))
				.categoryName(rs.getString("CATEGORY_NAME"))
				.pImgUrl(rs.getString("P_IMG_URL"))
				.productBrand(rs.getString("PRODUCT_BRAND"))
				.productName(rs.getString("PRODUCT_NAME"))
				.build();
				
	}
	
	public static ShoppingBasketDto getBasketOri(ResultSet rs) throws SQLException{
		
		return ShoppingBasketDto.builder()
				.cartNo(rs.getInt("CART_NO"))
				.memberId(rs.getString("MEMBER_ID"))
				.productId(rs.getInt("PRODUCT_ID"))
				.cartTotalPrice(rs.getInt("CART_TOTAL_PRICE"))
				.cartVolume(rs.getInt("CART_VOLUME"))
				.build();
				
	}
}
