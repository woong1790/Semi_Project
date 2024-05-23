package com.nbp.shoppingbasket.model.service;

import static com.nbp.common.JDBCTemplate.close;
import static com.nbp.common.JDBCTemplate.commit;
import static com.nbp.common.JDBCTemplate.getConnection;
import static com.nbp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.nbp.shoppingbasket.model.dao.ShoppingbasketDao;
import com.nbp.shoppingbasket.model.dto.ShoppingBasketDto;

public class ShoppingbasketService {
	
	public List<ShoppingBasketDto> searchAllBasket(String userId){
		Connection conn=getConnection();
		List <ShoppingBasketDto> list=new ShoppingbasketDao().searchAllBasket(conn, userId);
		close(conn);
		return list;
		
	}
	
	public int deleteBasket(int[] arr, String path) {
		Connection conn=getConnection();
		int result=new ShoppingbasketDao().deleteBasket(conn, arr, path);
		if(result>0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
		
	}
	
	public List<ShoppingBasketDto> selectCartAll(String userId){
		Connection conn=getConnection();
		List<ShoppingBasketDto> list=new ShoppingbasketDao().selectCartAll(conn, userId);
		commit(conn);
		close(conn);
		return list;
		
	}
	
	public int insertCart(ShoppingBasketDto cart) {
		Connection conn=getConnection();
		int result=new ShoppingbasketDao().insertCart(conn, cart);
		if(result>0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
	public int deleteBasket2(int[] arr, String path) {
		Connection conn=getConnection();
		int result=new ShoppingbasketDao().deleteBasket2(conn, arr, path);
		if(result>0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
		
	}
}
