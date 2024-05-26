package com.nbp.product.review.model.DAO;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.nbp.common.JDBCTemplate.*;

import com.nbp.product.review.model.DTO.Qna;

public class ProductQnaDao {

	private Properties sql = new Properties();
	{
		String path = ProductQnaDao.class.getResource("/sql/product/qna.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Qna> selectProductQnaAll(Connection conn, int cPage, int numPerpage, String productName){
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		List<Qna> result = new ArrayList();
		try {
		pstmt = conn.prepareStatement(sql.getProperty("selectQnaAll"));
		pstmt.setString(1, productName);
		pstmt.setInt(2, (cPage-1)*numPerpage+1);
		pstmt.setInt(3, cPage*numPerpage);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			result.add(getQna(rs));
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	public int selectProductQnaAllCount(Connection conn, String productName) {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		int result  =0;
		try {
		pstmt = conn.prepareStatement(sql.getProperty("selectQnaAllCount"));
		pstmt.setString(1, productName);
		rs=pstmt.executeQuery();
		if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	public static Qna getQna(ResultSet rs) throws SQLException {
		return Qna.builder()
				.qnaId(rs.getString("qna_id"))
				.memberId(rs.getString("member_id"))
				.qnaAnswerNumber(rs.getInt("qna_answer_number"))
				.qnaTitle(rs.getString("qna_title"))
				.qnaContent(rs.getString("qna_content"))
				.qnaEnrollDate(rs.getDate("qna_enroll_date"))
				.qnaupdateDate(rs.getDate("qna_update_date"))
				.qnadeleteDate(rs.getDate("qna_deleteDate"))
				.qnaDeleteYn(rs.getInt("qnaDeleteYn"))
				.qnaSecretYn(rs.getInt("qna_secretYn"))
				.productName(rs.getString("product_name"))
				.build();
	}
	
	
	
	
	
	
	
}
