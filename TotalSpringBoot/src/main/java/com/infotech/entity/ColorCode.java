/**
 * 
 */
package com.infotech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author eTaskin
 *
 * 27 Şub 2020
 * 
 */

@Entity
@Table(name = "COLOR_CODE")
public class ColorCode {

	@Id
	@Column(name = "COLOR_KEY", unique = true, nullable = false)
	private String COLOR_KEY;

	@Column(name = "COLOR_CODE")
	private String COLOR_CODE;

	@Column(name = "COLOR_EXP")
	private String COLOR_EXP;

	@Column(name = "COLOR_RGB")
	private String COLOR_RGB;

	public String getCOLOR_KEY() {
		return COLOR_KEY;
	}

	public void setCOLOR_KEY(String cOLOR_KEY) {
		COLOR_KEY = cOLOR_KEY;
	}

	public String getCOLOR_CODE() {
		return COLOR_CODE;
	}

	public void setCOLOR_CODE(String cOLOR_CODE) {
		COLOR_CODE = cOLOR_CODE;
	}

	public String getCOLOR_EXP() {
		return COLOR_EXP;
	}

	public void setCOLOR_EXP(String cOLOR_EXP) {
		COLOR_EXP = cOLOR_EXP;
	}

	public String getCOLOR_RGB() {
		return COLOR_RGB;
	}

	public void setCOLOR_RGB(String cOLOR_RGB) {
		COLOR_RGB = cOLOR_RGB;
	}

}
