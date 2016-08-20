package com.eazy.lksy.web.core.reptile;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.eazy.lksy.web.core.dao.DbConn;


public class Room implements Serializable {

	public Room(String name, String hid, String price) {
		super();
		this.name = name;
		this.hid = hid;
		this.price = price;
	}
	public Room(String name, String hid) {
		super();
		this.name = name;
		this.hid = hid;
	}
	public Room(String id, String name, String hid, String width, String heigh) {
		super();
		this.id = id;
		this.name = name;
		this.hid = hid;
		this.width = width;
		this.heigh = heigh;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeigh() {
		return heigh;
	}
	public void setHeigh(String heigh) {
		this.heigh = heigh;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	private static final long serialVersionUID = -7836736558044672612L;

	private String id;
	private String name;
	private String hid;
	private String width;
	private String heigh;
	private String price;
	
	public Room execute(String sql) {
		try {
			Connection conn = DbConn.getConn();

			int number = 0;
			
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("insert into room(name,h_id,price) values('"+name+"','"+hid+"','"+price+"')",Statement.RETURN_GENERATED_KEYS);
			ResultSet rs = stmt.getGeneratedKeys();
			
			if(rs.next()) {
				 number = rs.getInt(1);
			}
			conn.close();
			setId(number + "");
			return this;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		return null;
	}
	
	
	
}
