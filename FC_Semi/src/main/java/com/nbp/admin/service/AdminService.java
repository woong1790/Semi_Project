package com.nbp.admin.service;

import static com.nbp.common.JDBCTemplate.close;   
import static com.nbp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.nbp.admin.model.dao.AdminDao;
import com.nbp.model.DTO.Member;

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
//	public List<Member> searchMember(String type, String keyword){
//		Connection conn=getConnection();
//		List<Member> result=dao.searchMember(conn,type,keyword);
//		close(conn);
//		return result;
//	}
//	public int searchMemberCount(String type, String keyword) {
//		Connection conn=getConnection();
//		int count=dao.searchMemberCount(conn,type,keyword);
//		close(conn);
//		return count;
//	}
	
	
	
	
	
	
	

}
