package com.nbp.order.model.dao;

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

import com.nbp.order.model.dto.Order;
public class OrderDAO {
	private Properties sql = new Properties();
	{
		String path = OrderDAO.class.getResource("/sql/order/order.properties").getPath();
		try(FileReader fr= new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Order> selectOrderAll(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> orders = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectOrderAll"));
//			pstmt.setInt(1, (cPage-1)*numPerpage+1);
//			pstmt.setInt(2, cPage*numPerpage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				orders.add(getOrder(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return orders;
	}
	
	public static Order getOrder(ResultSet rs) throws SQLException{
		return Order.builder()
				.orderId(rs.getString("order_id"))
				.memberId(rs.getString("member_id"))
				.orderName(rs.getString("order_o_name"))
				.orderPhone(rs.getString("order_o_phone"))
				.orderReceiveName(rs.getString("order_r_name"))
				.orderReceiveAddress(rs.getString("order_r_adr"))
				.orderReceiveDetailAddress(rs.getString("order_r_d_adr"))
				.orderPrice(rs.getInt("order_t_price"))
				.orderDate(rs.getDate("order_date"))
				.orderMemo(rs.getString("order_memo"))
				.orderCode(rs.getInt("order_code"))
				.orderNum(rs.getInt("order_tr_num"))
				.orderDay(rs.getDate("order_d_day"))
				.build();
	}
	
}
