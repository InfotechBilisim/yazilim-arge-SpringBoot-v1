/**
 * 
 */
package com.infotech.dto;

import java.io.Serializable;

/**
 * @author eTaskin
 *
 * 19 Haz 2020
 * 
 */
public class FastLoginDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private String aut_key;
	private String ret_code;
	private String ret_state;
	private String ret_error;

	public String getAut_key() {
		return aut_key;
	}

	public void setAut_key(String aut_key) {
		this.aut_key = aut_key;
	}

	public String getRet_code() {
		return ret_code;
	}

	public void setRet_code(String ret_code) {
		this.ret_code = ret_code;
	}

	public String getRet_state() {
		return ret_state;
	}

	public void setRet_state(String ret_state) {
		this.ret_state = ret_state;
	}

	public String getRet_error() {
		return ret_error;
	}

	public void setRet_error(String ret_error) {
		this.ret_error = ret_error;
	}

}
