package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;

public class OrdersDAO {
	private DBContext db = new DBContext();
	private Connection conn;
	private int insertedId = 0;
	String generatedColumns[] = { "ID" };
	
	//insert information of Order to data source, including list of products 
	// in cart (c) and information of buyer in Order (o)
	public void insertOrder(Orders o, Cart c) throws Exception {
		String mail = o.getUserMail();
		int status = o.getStatus();
		String discount = o.getDiscount();
		String address = o.getAddress();
		
		conn = db.getConnection();
		String sql = "insert into Orders(user_mail,order_status,order_discount_code,order_address) values (?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql,generatedColumns);
		stmt.setString(1,mail);
		stmt.setInt(2,status);
		stmt.setString(3,discount);
		stmt.setString(4,address);
		stmt.executeUpdate();
	
		
		ResultSet rs = stmt.getGeneratedKeys();
		 if (rs.next()) {
		      insertedId = rs.getInt(1);
		    }
		rs.close();
		
		if(insertedId == 0) {
			stmt.close();
		} else {
		sql = "insert into Orders_detail(order_id,product_id,amount_product,price_product) values (?,?,?,?)";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1,insertedId);
		for (Product x : c.getItems()) {
			stmt.setInt(2, x.getId());
			stmt.setInt(3, x.getNumber());
			stmt.setInt(4,( int) x.getPrice());
			stmt.executeUpdate();
		}
		
		stmt.close();

		
		}
	}
}
