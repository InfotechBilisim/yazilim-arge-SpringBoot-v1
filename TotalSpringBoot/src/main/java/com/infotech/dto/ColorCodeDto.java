/**
 * 
 */
package com.infotech.dto;

import java.io.Serializable;

/**
 * @author eTaskin
 *
 *         27 Şub 2020
 * 
 */
public class ColorCodeDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private String color_key;

	private String color_code;

	private String color_exp;

	private String color_rgb;
	
	private String id;
	private String text;

	public String getColor_key() {
		return color_key;
	}

	public void setColor_key(String color_key) {
		this.color_key = color_key;
	}

	public String getColor_code() {
		return color_code;
	}

	public void setColor_code(String color_code) {
		this.color_code = color_code;
	}

	public String getColor_exp() {
		return color_exp;
	}

	public void setColor_exp(String color_exp) {
		this.color_exp = color_exp;
	}

	public String getColor_rgb() {
		return color_rgb;
	}

	public void setColor_rgb(String color_rgb) {
		this.color_rgb = color_rgb;
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
