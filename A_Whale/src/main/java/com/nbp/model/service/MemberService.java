package com.nbp.model.service;

import java.sql.Connection;

import com.nbp.model.DAO.MemberDAO;
import com.nbp.model.DTO.Member;
import static com.nbp.common.JDBCTemplate.*;

public class MemberService {
	private MemberDAO dao=new MemberDAO();
	
	public Member selectMemberById(String memberId,String password) {
		Connection conn=getConnection();
		Member m=dao.selectMemberById(conn, memberId);
		if(m==null||!m.getMemberPw().equals(password)) m=null;
		close(conn);
		return m;
	}
	public Member selectMemberById(String memberId) {
		Connection conn=getConnection();
		Member m=dao.selectMemberById(conn, memberId);
		close(conn);
		return m;
	}
	public int insertMember(Member m) {
		Connection conn=getConnection();
		int result=dao.insertMember(conn,m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
