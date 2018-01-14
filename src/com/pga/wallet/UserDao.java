package com.pga.wallet;
import java.sql.*;

public class UserDao {

	static Connection con;
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection
					("jdbc:mysql://localhost/wallet", "root","");
		}catch(Exception e) { e.printStackTrace(); }
	}

	static boolean checkUser(String userName) {
		try {
		String sql = "select * from user where userName=?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1, userName);
		 ResultSet rs = ps.executeQuery();
		 return rs.next();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	static boolean isValidUser(String userName, String pwd) {
		try {
		String sql = "select * from user where userName=? and pwd=?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1, userName);
		 ps.setString(2, pwd);
		 ResultSet rs = ps.executeQuery();
		 return rs.next();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	static User getUser(String userName) {
		try {
		String sql = "select * from user where userName=?";
		 PreparedStatement ps = con.prepareStatement(sql);
		 ps.setString(1, userName);
		 ResultSet rs = ps.executeQuery();
		 User user = new User();
		 if(rs.next()) {
			 user.setUser(rs.getString(1));
			 user.setFirstName(rs.getString(3));
			 user.setEmail(rs.getString(4));
			 user.setMobile(rs.getLong(5));
		 }
		 return user;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	static boolean addUser(User user) { 
		try {
			String query = "insert into user values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getUser());
			ps.setString(2, user.getPwd());
			ps.setString(3, user.getFirstName());
			ps.setString(4, user.getEmail());
			ps.setLong(5, user.getMobile());
			ps.executeUpdate();
			
			AccountDao.createAccount(user.getUser());
			return true;
		}catch(Exception e) { e.printStackTrace(); return false; }
	}
}












