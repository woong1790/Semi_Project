package com.nbp.wishlist.model.dao;

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
import com.nbp.wishlist.model.dto.WishlistDto;

public class WishlistDao {
	private Properties sql=new Properties();
	
	{
		
		String path=WishlistDao.class.getResource("/sql/wishlist/sql_wishlist.properties").getPath();
		try(FileReader fr1=new FileReader(path)) {
			sql.load(fr1);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	public List<WishlistDto> searchAllWish(Connection conn, String semiMemberId, int cPage, int numPerpage ) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<WishlistDto> list=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchAllWish"));
			pstmt.setString(1, semiMemberId);
			pstmt.setInt(2,(cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getWishlist(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
		
	} 
	
	public int selectWishCount(Connection conn, String semiMemberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectWishCount"));
			pstmt.setString(1, semiMemberId);
			rs=pstmt.executeQuery();
			rs.next();
			result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
		
	}
	
	public int deleteWish(Connection conn, int[] arr, String path) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			
			String semisql=this.sql.getProperty("deleteWish");
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
	
	public int deleteWish2(Connection conn, int[] arr, String path) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			
			String semisql=this.sql.getProperty("deleteWish2");
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
	
	
	
	
	
	
	
	public List<WishlistDto> selectWishAll(Connection conn, String userId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<WishlistDto> list=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectWishAll"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getWishlistOri(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	
		
	}
	
	public int insertWish(Connection conn, WishlistDto wish) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertWish"));
			pstmt.setInt(1, wish.getProductId());
			pstmt.setString(2, wish.getMemberId());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	

	
	
	public static WishlistDto getWishlist(ResultSet rs) throws SQLException {
		
		return WishlistDto.builder().wishListId(rs.getString("WISHLIST_ID"))
				.productId(rs.getInt("PRODUCT_ID"))
				.memberId(rs.getString("MEMBER_ID"))
				.productBrand(rs.getString("PRODUCT_BRAND"))
				.pImgUrl(rs.getString("P_IMG_URL"))
				.productName(rs.getString("PRODUCT_NAME"))
				.productprice(rs.getInt("PRODUCT_PRICE"))
				.build();

				
	} 
	
	public static WishlistDto getWishlistOri(ResultSet rs) throws SQLException {
		
		return WishlistDto.builder().wishListId(rs.getString("WISHLIST_ID"))
				.productId(rs.getInt("PRODUCT_ID"))
				.memberId(rs.getString("MEMBER_ID"))
				.build();

				
	} 
	
}
