package com.demo.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.demo.model.Product;

public class ProductService {

	Connection conn;
	
	public ProductService() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/world", "root", "Abcd1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Product> viewAll() {

		ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement ps;
		ResultSet res;
		try {
			ps = conn.prepareCall("select * from products");
			res = ps.executeQuery();
			if (!res.next()) {
				System.out.println("no data");
			}
			do {
				Product p = new Product (res.getString(2), res.getDouble(3), res.getString(4));
				p.setId(1);
				list.add(p);
			} while (res.next());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int insert (Product p) {
		try {
			PreparedStatement ps = conn.prepareStatement("insert into products (name, price, seller) values (?, ?, ?)");
			try {
				ps.setString(1, p.getName());
				ps.setDouble(2, p.getPrice());
				ps.setString(3, p.getSeller());
				return ps.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return -1;
	}
}
