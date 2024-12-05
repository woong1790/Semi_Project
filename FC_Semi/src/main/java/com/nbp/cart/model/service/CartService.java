package com.nbp.cart.model.service;

import static com.nbp.common.JDBCTemplate.close;
import static com.nbp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.nbp.cart.model.DAO.CartDAO;
import com.nbp.cart.model.DTO.Cart;

public class CartService {
	private CartDAO dao=new CartDAO();
	
	public List<Cart> selectCartByMemberId(String memberId) {
		Connection conn=getConnection();
		List<Cart> carts=dao.selectCartByMemberId(conn, memberId);
		close(conn);
		return carts;
	}
}
