package com.infotech.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {
	@Id
	@Column(name = "username", unique = true, nullable = false)
	private String username;

	@Column(name = "company")
	private String company;

	@Column(name = "password")
	private String password;

	@Column(name = "uname")
	private String uname;

	@Column(name = "usurname")
	private String usurname;

	// @ManyToOne(fetch = FetchType.LAZY) //Veritabanında user tablosunda olup
	// PrivilegeCodes tablosunda karşılığı olmayan değerler var, Eager olunca hata
	// alınıyor. bundan dolayı lazy yapıldı.
	// @JoinColumn(name = "privilege")
	// private PrivilegeCodes privilege;
	
	@Column(name = "privilege")
	private Long privilege;

	@Column(name = "log_id")
	private Long logId;

	@Column(name = "session_id")
	private Long sessionId;

	@Column(name = "email")
	private String email;
	@Column(name = "last_login_time_stamp")
	private Date lastLoginTimeStamp;

	@Column(name = "password_expiry_date")
	private Date passwordExpiryDate;

	@Column(name = "projectname")
	private String projectname;

	@Column(name = "aktif_bas_tar")
	private Date aktifBasTar;

	@Column(name = "aktif_bit_tar")
	private Date aktifBitTar;

	@Column(name = "birim_kodu")
	private String birimKodu;

	@Column(name = "daily_login_failure")
	private Long dailyLoginFailure = 0L;

	@Column(name = "monthly_login_lock")
	private Long monthlyLoginLock = 0L;

	@Column(name = "login_lock")
	private Long loginLock = 0L;
	
	@Column(name = "login_date")
	private Date loginDate;

	@Column(name = "rec_type")
	private Long recType;

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


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
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


	public Long getPrivilege() {
		return privilege;
	}


	public void setPrivilege(Long privilege) {
		this.privilege = privilege;
	}


	public Long getLogId() {
		return logId;
	}


	public void setLogId(Long logId) {
		this.logId = logId;
	}


	public Long getSessionId() {
		return sessionId;
	}


	public void setSessionId(Long sessionId) {
		this.sessionId = sessionId;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getLastLoginTimeStamp() {
		return lastLoginTimeStamp;
	}


	public void setLastLoginTimeStamp(Date lastLoginTimeStamp) {
		this.lastLoginTimeStamp = lastLoginTimeStamp;
	}


	public Date getPasswordExpiryDate() {
		return passwordExpiryDate;
	}


	public void setPasswordExpiryDate(Date passwordExpiryDate) {
		this.passwordExpiryDate = passwordExpiryDate;
	}


	public String getProjectname() {
		return projectname;
	}


	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}


	public Date getAktifBasTar() {
		return aktifBasTar;
	}


	public void setAktifBasTar(Date aktifBasTar) {
		this.aktifBasTar = aktifBasTar;
	}


	public Date getAktifBitTar() {
		return aktifBitTar;
	}


	public void setAktifBitTar(Date aktifBitTar) {
		this.aktifBitTar = aktifBitTar;
	}


	public String getBirimKodu() {
		return birimKodu;
	}


	public void setBirimKodu(String birimKodu) {
		this.birimKodu = birimKodu;
	}


	public Long getDailyLoginFailure() {
		return dailyLoginFailure;
	}


	public void setDailyLoginFailure(Long dailyLoginFailure) {
		this.dailyLoginFailure = dailyLoginFailure;
	}


	public Long getMonthlyLoginLock() {
		return monthlyLoginLock;
	}


	public void setMonthlyLoginLock(Long monthlyLoginLock) {
		this.monthlyLoginLock = monthlyLoginLock;
	}


	public Long getLoginLock() {
		return loginLock;
	}


	public void setLoginLock(Long loginLock) {
		this.loginLock = loginLock;
	}


	public Date getLoginDate() {
		return loginDate;
	}


	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}


	public Long getRecType() {
		return recType;
	}


	public void setRecType(Long recType) {
		this.recType = recType;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", company=" + company + ", password=" + password + ", uname=" + uname
				+ ", usurname=" + usurname + ", privilege=" + privilege + ", logId=" + logId + ", sessionId="
				+ sessionId + ", email=" + email + ", lastLoginTimeStamp=" + lastLoginTimeStamp
				+ ", passwordExpiryDate=" + passwordExpiryDate + ", projectname=" + projectname + ", aktifBasTar="
				+ aktifBasTar + ", aktifBitTar=" + aktifBitTar + ", birimKodu=" + birimKodu + ", dailyLoginFailure="
				+ dailyLoginFailure + ", monthlyLoginLock=" + monthlyLoginLock + ", loginLock="
				+ loginLock + ", loginDate=" + loginDate + ", recType=" + recType + "]";
	}

}