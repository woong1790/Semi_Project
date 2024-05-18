package com.nbp.product.model.service;

import java.sql.Connection;
import java.util.List;

import com.nbp.product.model.DAO.ProductDao;
import com.nbp.product.model.DTO.Product;
import static com.nbp.common.JDBCTemplate.getConnection;

public class ProductService {

	private ProductDao dao = new ProductDao();
	
	public List<Product> selectProductAll(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Product> result = dao.selectProductAll(conn, cPage, numPerpage);
		return result;
	}
}
