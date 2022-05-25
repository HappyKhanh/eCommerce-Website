package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

public class ListProductDAO {
	private DBContext db = new DBContext();
	private Connection conn;
	//return the list of products by product name
	public List<Product> search(String characters) throws Exception {
	
		conn = db.getConnection();
		
		String sql = "Select * from Products where product_name LIKE '%"+characters+"%'";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		List<Product> lp = new ArrayList<>();
		while (rs.next()) {
			int id = rs.getInt("product_id");
			String name = rs.getString("product_name");
			String des = rs.getString("product_des");
			float price = rs.getFloat("product_price");
			String src = rs.getString("product_img_source");
			String type = rs.getString("product_type");
			String brand = rs.getString("product_brand");
			Product pd = new Product(id,name,des,price,src,type,brand);
			lp.add(pd);
		}
		conn.close();
		return lp;
	}
	//get the product
	public Product getProduct (String id) throws Exception {
		Product pd;
		conn = db.getConnection();
		
		String sql = "Select * from Products where product_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, id);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			int idd = Integer.parseInt(id);
			String name = rs.getString("product_name");
			String des = rs.getString("product_des");
			float price = rs.getFloat("product_price");
			String src = rs.getString("product_img_source");
			String type = rs.getString("product_type");
			String brand = rs.getString("product_brand");

			pd = new Product(idd,name,des,price,src,type,brand);
		} else {
			pd = new Product();
		}
		return pd;
	}
}
