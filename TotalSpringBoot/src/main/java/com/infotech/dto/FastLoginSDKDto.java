/**
 * 
 */
package com.infotech.dto;

import java.io.Serializable;

/**
 * @author eTaskin
 *
 *         16.Tem.2020
 * 
 */
public class FastLoginSDKDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private String token;
	private String resultCode;
	private String resultName;
	private String resultMessage;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultName() {
		return resultName;
	}

	public void setResultName(String resultName) {
		this.resultName = resultName;
	}

	public String getResultMessage() {
		return resultMessage;
	}

	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}
}
