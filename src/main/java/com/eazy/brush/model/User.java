package com.eazy.brush.model;

import java.io.Serializable;
import java.util.Date;


public class User  implements Serializable {

	public User(String name, String password, String email) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
	}
	public User(Integer id, String name, String password) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
	}
	public User(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}
	
	private static final long serialVersionUID = 1473242945384450906L;
	
	
	
	private Integer id;
	private String name;
	private String password;
	private Date create_time;
	private String status;
	private String email;
	private String desc;
	
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public User() {
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public String getStatus() {
		return status;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
