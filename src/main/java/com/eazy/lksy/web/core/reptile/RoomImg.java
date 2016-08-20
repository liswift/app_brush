package com.eazy.lksy.web.core.reptile;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.eazy.lksy.web.core.dao.DbConn;

public class RoomImg implements Serializable {

	public RoomImg(String image, String roomId) {
		super();
		this.image = image;
		this.roomId = roomId;
	}

	private static final long serialVersionUID = -7944460832338251674L;
	
	private String image;
	private String roomId;
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	
	public RoomImg execute(String sql) {
		try {
			Connection conn = DbConn.getConn();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("insert into room_image(image,r_id) values('"+image+"','"+roomId+"')");
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		return null;
	}
}
