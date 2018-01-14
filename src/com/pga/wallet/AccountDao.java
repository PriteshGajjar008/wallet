package com.pga.wallet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDao {
	static Connection con;
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection
					("jdbc:mysql://localhost/wallet", "root","");
		}catch(Exception e) { e.printStackTrace(); }
	}

	public static void createAccount(String userName) {
		try {
			String query = "insert into account values(?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, userName);
			ps.setFloat(2, 0);
			ps.executeUpdate();
		}catch(Exception e) { e.printStackTrace(); }
	}
	
	public static float getBalance(String userName) {
		try {
			String query = "select balance from account where userName=?";
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getFloat(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static void addToWallet(String userName, float amt) {
	  String query = 
			 "update account set balance=balance + ? where userName=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setFloat(1, amt);
			ps.setString(2, userName);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}









