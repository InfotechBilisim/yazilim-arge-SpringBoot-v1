package com.infotech.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.infotech.config.Utils;
import com.infotech.service.CookieService;

@Controller
@RequestMapping("/logout")
public class LogoutController {

	@Autowired
	private CookieService cookieService;
	@Autowired
	private Utils utils;
	@RequestMapping(method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		cookieService.clearCookie(response, request);
		session.invalidate();
		utils.clear();
		return "redirect:/login";
	}
}
