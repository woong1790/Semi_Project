package com.nbp.wishlist.model.DAO;

import static com.nbp.common.JDBCTemplate.close;
import static com.nbp.common.JDBCTemplate.getConnection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.nbp.model.DAO.MemberDAO;
import com.nbp.model.DTO.Member;
import com.nbp.wishlist.model.DTO.WishList; 

public class WishListDAO {
	private Properties sql=new Properties();
	{
		String path=WishListDAO.class
				.getResource("wishlist.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public WishList selectWishByMemberId(Connection conn, String productId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		WishList w=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectWishListById"));
			pstmt.setString(1, productId);
			rs=pstmt.executeQuery();
			if(rs.next()) w=getWishList(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return w;	
	}
	
	public int insertWishByMemberId(Connection conn, int productId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteWishListById"));
			pstmt.setInt(1, productId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;	
	}
	
	public int deleteWishByMemberId(Connection conn, int productId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteWishListById"));
			pstmt.setInt(1, productId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;	
	}
	
	public static WishList getWishList(ResultSet rs) throws SQLException{
		return WishList.builder()
				.wishListNo(rs.getInt(""))
				.productNo(rs.getInt(""))
				.memberId(rs.getString(""))
				.build();
	}
}
