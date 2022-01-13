package com.infotech.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="app_log")
public class AppLog {
	
	@Column(name = "APP_NAME")
	private String appName;
	
	@Column(name = "TIME_STAMP")
	private Date timeStamp;
	
	@Column(name = "REQUEST_NAME")
	private String requestName;

	@Column(name = "USERNAME")
	private String username;
	
	@Column(name = "COMPANY")
	private String company;
	
	@Column(name = "TXT")
	private String txt;
	
	@Column(name = "CLIENT_IP")
	private String clientIp;
	
	@Column(name = "RESPONSE")
	private String response;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "idSequence")
	@SequenceGenerator(name = "idSequence", sequenceName = "SEQ_APP_LOG_ROWNO", allocationSize = 1)
	@Column(name = "rowno",unique=true,nullable=false)
	private Long rowno;
	
	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public Date getTimeStamp() {
		return timeStamp;
	}

	public void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}

	public String getRequestName() {
		return requestName;
	}

	public void setRequestName(String requestName) {
		this.requestName = requestName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public Long getRowno() {
		return rowno;
	}

	public void setRowno(Long rowno) {
		this.rowno = rowno;
	}
	
}
