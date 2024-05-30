package com.nbp.product.model.service;

import java.sql.Connection;		
import java.util.List;

import com.nbp.product.model.DAO.ProductDao;
import com.nbp.product.model.DTO.Product;
import static com.nbp.common.JDBCTemplate.getConnection;
import static com.nbp.common.JDBCTemplate.close;
	
public class ProductService {

	private ProductDao dao = new ProductDao();
	
	public List<Product> selectProductAll(int firstNo, int lastNo){
		Connection conn = getConnection();
		List<Product> result = dao.selectProductAll(conn, firstNo, lastNo);
		close(conn);
		return result;
	}
	
	public int selectProductAllCount() {
		Connection conn = getConnection();
		int result = dao.selectProductAllCount(conn);
		close(conn);
		return result;
		
	}
	
	public Product selectProductInfo(String title) {
		Connection conn = getConnection();
		Product result = dao.selectProductInfo(conn,title);
		close(conn);
		return result;
	}
	
	public List<Product> searchProduct(String title, String subTitle, int firstNo, int lastNo){
		Connection conn = getConnection();
		List<Product> result = dao.searchProduct(conn, title, subTitle, firstNo, lastNo);
		close(conn);
		return result;
	}
	
	public String[] selectProductImg (int productNo) {
		Connection conn = getConnection();
		String[] result = dao.selectProductImg(conn, productNo);
		close(conn);
		return result;
	}
}
