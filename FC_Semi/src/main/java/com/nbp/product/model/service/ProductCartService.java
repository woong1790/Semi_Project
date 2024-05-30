package com.nbp.product.model.service;

import java.sql.Connection;

import com.nbp.product.model.DAO.ProductCartDao;
import static com.nbp.common.JDBCTemplate.*;

public class ProductCartService {

	private ProductCartDao dao = new ProductCartDao();
	
	public int insertCart(String memberId, String productId,String productPrice,String cartVolume,String optionName,String optionPrice) {
		Connection conn = getConnection();
		int result = dao.insertCart(conn, memberId, productId,productPrice,cartVolume, optionName, optionPrice);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
