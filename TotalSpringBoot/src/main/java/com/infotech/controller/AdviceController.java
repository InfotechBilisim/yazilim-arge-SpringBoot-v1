/**
 * 
 */
package com.infotech.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.infotech.dto.CookieResponseDto;
import com.infotech.service.CookieService;


@ControllerAdvice
public class AdviceController {

	@Autowired
	private CookieService cookieService;

	@ExceptionHandler(NoHandlerFoundException.class)
	public String handle(Exception ex) {
		return "404";
	}

	@RequestMapping(value = { "/404" }, method = RequestMethod.GET)
	public String NotFoudPage() {
		return "404";

	}

	@ModelAttribute
	public void handleRequest(HttpServletRequest request, HttpServletResponse response, Model model) {
		CookieResponseDto isIn = cookieService.isCookie(request, response,false);

		//if (isIn.isSessionExpire()) {
		//	response.sendRedirect("firmasoft_login");
		//}
	}

}
