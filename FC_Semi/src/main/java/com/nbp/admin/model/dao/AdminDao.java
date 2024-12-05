package com.nbp.admin.model.dao;

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

import com.nbp.model.DTO.Member;
import com.nbp.product.model.DTO.Product;
import com.nbp.model.DAO.MemberDAO;




public class AdminDao {
	private Properties sql = new Properties();
	
	{
		String path=AdminDao.class.getResource("/sql/admin/admin.properties").getPath();
		try (FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> selectMemberAll (Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		List<Member> members=new ArrayList<>();
		try {
			pstmt =conn.prepareStatement(sql.getProperty("selectMemberAll"));

			rs=pstmt.executeQuery();
			while(rs.next()) {
				members.add(MemberDAO.getMember(rs)); 
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return members;
	}
	
	public int selectMemberAllCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		int result =0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberAllCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1); //이런거 할때!! index 쓴다
			}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public List<Product> adminSelectProductAll(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Product> products = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql.getProperty("adminSelectProductAll"));
            rs = pstmt.executeQuery();
            while(rs.next()) {
            	products.add(getProduct(rs));
			}
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return products;
    }
	
	
	
	public int insertProduct(Connection conn, Product product) {
		PreparedStatement pstmt = null;
		int result = 0;
        try {
            pstmt = conn.prepareStatement(sql.getProperty("insertProduct"));
            
            pstmt.setString(1, product.getProductName());
            pstmt.setString(2, product.getProductSubname());
            pstmt.setString(3, product.getProductBrand());
            pstmt.setInt(4, product.getProductPrice());
            pstmt.setString(5, product.getProductDetail());
            pstmt.setString(6, product.getProductOrigin());
            pstmt.setInt(7, product.getProductAlcoholLv());         
            pstmt.setInt(8, product.getProductAge());          
            pstmt.setInt(9, product.getProductStock());
            pstmt.setString(10, product.getProductImg());

            pstmt.setInt(11, product.getProductVolume());
            pstmt.setString(12, product.getCategoryName());

            result = pstmt.executeUpdate();
        }catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
    }
	
	public int deleteProduct(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteProduct"));
			pstmt.setInt(1, productNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	static public Product getProduct(ResultSet rs) throws SQLException {
		return Product.builder()
				.productNo(rs.getInt("product_no"))
				.productName(rs.getString("product_name"))
				.productSubname(rs.getString("product_subname"))
				.productDetail(rs.getString("product_detail"))
				.productPrice(rs.getInt("product_price"))
				.productStock(rs.getInt("product_stock"))
				.productAlcoholLv(rs.getInt("product_alcohol_lv"))
				.productOrigin(rs.getString("product_origin"))
				.productVolume(rs.getInt("product_volume"))
				.productAge(rs.getInt("product_age"))
				.productBrand(rs.getString("product_brand"))
				.productEnrollDate(rs.getDate("product_enroll_date"))
				.productDeleteYn(rs.getInt("product_delete_yn"))
				.memberId(rs.getString("member_id"))
				.productImg(rs.getString("product_img"))
				.categoryName(rs.getString("category_name"))
				.build();
	}

//	public List<Member> searchMember(Connection conn, 
//			String type, String keyword){
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		List<Member> result=new ArrayList<>();
//		try {
//			String sql=this.sql.getProperty("selectSearchMember");
//			sql=sql.replace("#COL", type); //중요한 부분!!!!
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1,type.equals("userName")?"%"+keyword+"%":keyword); //이름으로 조회는 분기처리하던가 %를 쓴다
//			pstmt.setInt(2, (cPage-1)*numPerpage+1);
//			pstmt.setInt(3, cPage*numPerpage);
//			rs=pstmt.executeQuery();
//			while(rs.next()) {
//				result.add(MemberDAO.getMember(rs));
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return result;
//	}
//	public int searchMemberCount(Connection conn,String type, String keyword) {
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		int result=0;
//		String sql=this.sql.getProperty("searchMemberCount");
//		sql=sql.replace("#COL", type);
//		try {
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1,type.equals("userName")?"%"+keyword+"%":keyword);
//			rs=pstmt.executeQuery();
//			if(rs.next()) result=rs.getInt(1);
//			
//		}catch(SQLException e) {
//			
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return result;
//	}
	
	
	
	
	
	
}
