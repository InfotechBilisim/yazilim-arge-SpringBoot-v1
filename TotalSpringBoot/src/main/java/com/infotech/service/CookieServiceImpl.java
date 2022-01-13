/**
 * 
 */
package com.infotech.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.infotech.config.Utils;
import com.infotech.dto.CookieResponseDto;
import com.infotech.entity.User;
import com.infotech.util.CryptoUtil;


@Service
public class CookieServiceImpl implements CookieService {

	@Autowired
	HttpSession session;
	
	@Autowired
	private Utils utils;
	
	@Autowired
	private UserService userService;

	@Value("${remember_name}")
	private String remember_name;

	@Value("${remember_password}")
	private String remember_password;

	@Value("${remember_css}")
	private String remember_css;

	@Value("${remember_lang}")
	private String remember_lang;

	@Value("${remember_icon}")
	private String remember_icon;

	@Value("${secretkey}")
	private String secretkey;

	@Value("${cookie_age}")
	private int cookie_age;

	@Value("${session_expire_time}")
	private Long session_expire_time;

	public CookieResponseDto isCookie(HttpServletRequest request, HttpServletResponse response, boolean pageChanges) {
		CookieResponseDto rDto = new CookieResponseDto();
		String u = utils.getUsername();// Zaten session varsa cookiden giriş yapmasına gerek yok.
		System.out.println("---------------------------------------------- username " + u);
		if (!(u == null || u.equals(""))) {
			System.out.println("---------------------------------------------- username1 " + u);
			Long activationTime = (Long) session.getAttribute("activation-time");

			if (pageChanges && activationTime != null
					&& System.currentTimeMillis() > (activationTime + session_expire_time)) {
				User user = userService.loginByUsernameAndPassword(u, utils.getSessionUser().getPassword());
				if (user != null) {
					/*if ((user.getActive_flag() == null || user.getActive_flag() != 1)
							|| (!userService.userCompanyInUseControl(user.getCompany()))) {
						rDto.setLoggedIn(false);
						rDto.setSessionExpire(true);
						// session.setAttribute("activation-time", System.currentTimeMillis());
						clearCookie(response, request);
						return rDto;
					} else {*/
						rDto.setLoggedIn(true);
						rDto.setSessionExpire(false);
						session.setAttribute("activation-time", System.currentTimeMillis());
						return rDto;
					//}
				} else {
					rDto.setLoggedIn(false);
					rDto.setSessionExpire(true);
					clearCookie(response, request);
					return rDto;
				}
			} else {
				rDto.setLoggedIn(true);
				rDto.setSessionExpire(false);
				return rDto;
			}
		}

		Cookie[] cookies = request.getCookies();
		if (cookies == null) {
			utils.setRememberMeActive(false);
			rDto.setLoggedIn(false);
			rDto.setSessionExpire(false);
			return rDto;
		}
		

		String username = getCookieByName(cookies, remember_name);
		String password = getCookieByName(cookies, remember_password);
		String css = getCookieByName(cookies, remember_css);
		String lang = getCookieByName(cookies, remember_lang);
		String icon = getCookieByName(cookies, remember_icon);

		if (username != null && password != null && !username.equals("") && !password.equals("")) {

			String decryptUsername = CryptoUtil.decrypt(username, secretkey);
			String decryptPass = CryptoUtil.decrypt(password, secretkey);
			
			System.out.println("---------------------------------------------- decryptUsername " + decryptUsername);
			System.out.println("---------------------------------------------- decryptPass " + decryptPass);

			if (decryptUsername != null && decryptPass != null) {
				User user = userService.loginByUsernameAndPassword(decryptUsername, decryptPass);
				if (user != null) {
					/*if ((user.getActive_flag() == null || user.getActive_flag() != 1)) {
						rDto.setLoggedIn(false);
						rDto.setSessionExpire(true);
						clearCookie(response, request);
						return rDto;
					}*/
					

					System.out.println("---------------------------------------------- user __ " + user.toString());

					session.setAttribute("user", user);
					session.setAttribute("css", CryptoUtil.decrypt(css, secretkey));
					session.setAttribute("param", CryptoUtil.decrypt(icon, secretkey));
					session.setAttribute("language", CryptoUtil.decrypt(lang, secretkey));
					session.setAttribute("activation-time", System.currentTimeMillis());
					utils.setRememberMeActive(true);
				//	Utils.get().setUserRightGeo(user.getRightgeo());
					rDto.setLoggedIn(true);
					rDto.setSessionExpire(false);
					
					return rDto;
				}else {
					System.out.println("---------------------------------------------- User bulunamadı __ ");
				}
			}else {
				clearCookie(response, request);
			}
		}
		
		utils.setRememberMeActive(false);
		rDto.setLoggedIn(false);
		rDto.setSessionExpire(false);

		return rDto;
	}

	private String getCookieByName(Cookie[] cookies, String name) {

		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name)) {
				return cookie.getValue();
			}
		}
		return "";
	}

	public void clearCookie(HttpServletResponse response, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();

		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {

				boolean hasCookie = false;
				String name = cookie.getName();

				if (cookie.getName().equals(remember_name)) {
					name = remember_name;
					hasCookie = true;
				} else if (cookie.getName().equals(remember_password)) {
					name = remember_password;
					hasCookie = true;
				} else if (cookie.getName().equals(remember_css)) {
					name = remember_css;
					hasCookie = true;
				} else if (cookie.getName().equals(remember_lang)) {
					name = remember_lang;
					hasCookie = true;
				} else if (cookie.getName().equals(remember_icon)) {
					name = remember_icon;
					hasCookie = true;
				}

				if (hasCookie) {
					Cookie cookie1 = new Cookie(name, "");
					cookie1.setPath("/");
					cookie1.setMaxAge(0);
					response.addCookie(cookie1);
				}
			}
		}

		utils.setRememberMeActive(false);

	}

	public void createCookie(String username, String password, String css, String language, String icon,
			HttpServletResponse response) {
		Cookie ucookie = new Cookie(remember_name, CryptoUtil.encrypt(username, secretkey));
		Cookie pascookie = new Cookie(remember_password, CryptoUtil.encrypt(password, secretkey));
		Cookie csscookie = new Cookie(remember_css, CryptoUtil.encrypt(css, secretkey));
		Cookie languagecookie = new Cookie(remember_lang, CryptoUtil.encrypt(language, secretkey));
		Cookie iconcookie = new Cookie(remember_icon, CryptoUtil.encrypt(icon, secretkey));

		ucookie.setPath("/");
		pascookie.setPath("/");
		csscookie.setPath("/");
		languagecookie.setPath("/");
		iconcookie.setPath("/");

		ucookie.setMaxAge(cookie_age);
		pascookie.setMaxAge(cookie_age);
		csscookie.setMaxAge(cookie_age);
		languagecookie.setMaxAge(cookie_age);
		iconcookie.setMaxAge(cookie_age);

		response.addCookie(ucookie);
		response.addCookie(pascookie);
		response.addCookie(csscookie);
		response.addCookie(languagecookie);
		response.addCookie(iconcookie);

		utils.setRememberMeActive(true);
	}

}
