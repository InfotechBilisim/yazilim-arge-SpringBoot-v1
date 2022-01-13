package com.infotech.dto;

import java.io.Serializable;

public class UsersDto implements Serializable {

	private static final long serialVersionUID = 2882855837547118288L;

	private String username;
	private String uname;
	private String usurname;
	private String company;
	//Bu iki alan kombo dolumları için kullanmak üzere eklendi.
	private String id;
	private String text;

	public UsersDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UsersDto(String username, String uname, String usurname, String company) {
		super();
		this.username = username;
		this.uname = uname;
		this.usurname = usurname;
		this.company = company;
		this.id = username;
		this.text = username;//uname != null ? uname : "" + " " + usurname != null ? usurname : "";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUsurname() {
		return usurname;
	}

	public void setUsurname(String usurname) {
		this.usurname = usurname;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
