package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import context.DBContext;

public class Account {
	private String usr, pwd;
	private int role;
	private String name, address, phone;
	private int check;

	public Account() {
	}
	
	public Account(String usr, String pwd) {
		this.usr = usr;
		this.pwd = pwd;
	}
	
	public Account(String usr, String pwd, int role, String name, String address, String phone, int check) {
		this.usr = usr;
		this.pwd = pwd;
		this.role = role;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.check = check;
	}

	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}
	
	public boolean login () throws Exception {
		DBContext db = new DBContext();
		Connection conn =db.getConnection();
		
		//Truy van user va pwd da co trong db hay chua
		String sql = "Select count(*) as count from Account where user_mail=? and password=?";
				
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,usr);
		stmt.setString(2,pwd);
		
		ResultSet rs = stmt.executeQuery();
		int count = 0;
		
		if(rs.next()) {
			count = rs.getInt("count");
		} 
		
		if(count==0) {
			return false;
		} 
		else {
			return true;
		}
	}
}
