package com.eazy.lksy.web.core.reptile;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.eazy.lksy.web.core.dao.DbConn;


public class Hotel implements Serializable {

	public Hotel(String id, String hotelName, String tel, String address, String cityId, String img, String star,
			String about, String log, String lat, String desc) {
		super();
		this.id = id;
		this.hotelName = hotelName;
		this.tel = tel;
		this.address = address;
		this.cityId = cityId;
		this.img = img;
		this.star = star;
		this.about = about;
		this.log = log;
		this.lat = lat;
		this.desc = desc;
	}
	public Hotel execute(String sql) {
		try {
			Connection conn = DbConn.getConn();

			int number = 0;
			
			Statement stmt = conn.createStatement();
			sql = "insert into hotel(hotel_name,tel,address,city_id,img,star,about,hotel.`log`,lat,des) values('"+hotelName+"','"+tel+"','"+address+"','"+cityId+"','"+img+"','"+star+"','"+about+"','"+log+"','"+lat+"','"+desc+"') ";
			stmt.executeUpdate(sql,Statement.RETURN_GENERATED_KEYS);
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
	private static final long serialVersionUID = 4984468442314823293L;

	private String id;
	private String hotelName;
	private String tel;
	private String address;
	private String cityId;
	private String img;
	private String star;
	private String about;
	private String log;
	private String lat;
	private String desc;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getLog() {
		return log;
	}
	public void setLog(String log) {
		this.log = log;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	@Override
	public String toString() {
		return "Hotel [id=" + id + ", hotelName=" + hotelName + ", tel=" + tel + ", address=" + address + ", cityId="
				+ cityId + ", img=" + img + ", star=" + star + ", about=" + about + ", log=" + log + ", lat=" + lat
				+ ", desc=" + desc + "]";
	}
	
	
}
