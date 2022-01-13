package com.infotech.dto;

import java.io.Serializable;

public class CookieResponseDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private boolean loggedIn;

	private boolean sessionExpire;

	public CookieResponseDto(boolean loggedIn, boolean sessionExpire) {
		super();
		this.loggedIn = loggedIn;
		this.sessionExpire = sessionExpire;
	}

	public CookieResponseDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean isLoggedIn() {
		return loggedIn;
	}

	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

	public boolean isSessionExpire() {
		return sessionExpire;
	}

	public void setSessionExpire(boolean sessionExpire) {
		this.sessionExpire = sessionExpire;
	}

}
