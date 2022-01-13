/**
 * 
 */
package com.infotech.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infotech.dto.CookieResponseDto;

/**
 * @author eTaskin
 *
 * 30 Mar 2020
 * 
 */
public interface CookieService {

	void clearCookie(HttpServletResponse response, HttpServletRequest request);

	CookieResponseDto isCookie(HttpServletRequest request,HttpServletResponse response,boolean pageChanges);

	/**
	 * @param username
	 * @param password
	 * @param css
	 * @param language
	 * @param param
	 * @param response
	 */
	void createCookie(String username, String password, String css, String language, String param,
			HttpServletResponse response);

}
