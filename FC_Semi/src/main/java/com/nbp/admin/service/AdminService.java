package com.nbp.admin.service;

import static com.nbp.common.JDBCTemplate.close;
import static com.nbp.common.JDBCTemplate.commit;
import static com.nbp.common.JDBCTemplate.getConnection;
import static com.nbp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.nbp.admin.model.dao.AdminDao;
import com.nbp.model.DTO.Member;
import com.nbp.product.model.DTO.Product;

public class AdminService {
	private AdminDao dao= new AdminDao();
	
	public List<Member> selectMemberAll(){
		Connection conn= getConnection();
		List<Member> members=dao.selectMemberAll(conn); 
		close(conn);
		return members;
	}
	public int selectMemberAllCount(){ 
		Connection conn= getConnection();
		int result =dao.selectMemberAllCount(conn);
		close(conn);
		return result;
	}

	
	public int insertProduct(Product n) {
		Connection conn= getConnection();
		int result = dao.insertProduct(conn,n);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteNotice(int no) {
		Connection conn = getConnection();
		int result =dao.deleteProduct(conn,no);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	
	
	
	

}
