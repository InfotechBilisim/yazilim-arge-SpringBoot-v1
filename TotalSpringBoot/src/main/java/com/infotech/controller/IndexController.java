package com.infotech.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.annotation.SessionScope;

import com.infotech.config.Utils;
import com.infotech.dto.BolgeDto;
import com.infotech.dto.CookieResponseDto;
import com.infotech.dto.DataSuggestionDto;
import com.infotech.entity.User;
import com.infotech.service.BolgeService;
import com.infotech.service.CommonService;
import com.infotech.service.CookieService;
import com.infotech.service.UserService;
import com.infotech.util.ResponseUtil;

@Controller
@SessionScope
public class IndexController {

	private static final Logger logger = LogManager.getLogger(IndexController.class);

	@Autowired
	private Utils utils;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BolgeService bolgeService;

	@Autowired
	private CommonService commonService;

	@Autowired
	private CookieService cookieService;

	@GetMapping({ "/events" })
	public String events(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_events", request, response);
	}

	@GetMapping({ "/trips" })
	public String trips(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_trips", request, response);
	}

	@GetMapping({ "/settings_management_vehicles" })
	public String usersMobile(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedInAndIsAdmin("firmasoft_users_mobile", request, response);
	}

	@GetMapping({ "/auto_reports" })
	public String firmasoft_auto_reports(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedInAndIsAdmin("firmasoft_auto_reports", request, response);
	}

	@GetMapping({ "/dashboard" })
	public String dashboard(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_dashboard", request, response);
	}

	@GetMapping({ "/performance" })
	public String performance(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_performance", request, response);
	}

	@GetMapping({ "/settings_management_users" })
	public String settings_management_users(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedInAndIsAdmin("firmasoft_settings_management_users", request, response);
	}

	@GetMapping({ "/settings_user_info" })
	public String settings_user_info(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_settings_user_info", request, response);
	}

	@GetMapping("/index")
	public String flytoIndex(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_index", request, response);
	}

	@GetMapping("/heatmap")
	public String heatmap(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_heatmap", request, response);
	}
	
	@GetMapping("/regionmap")
	public String regionmap(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_regionmap", request, response);
	}
	
	@GetMapping("/coordsmap")
	public String coordsmap(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_coordsmap", request, response);
	}
	
	@GetMapping("/reports")
	public String reports(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_reports", request, response);
	}

	@GetMapping("/settings_user_vehicle_groups")
	public String settings_user_vehicle_groups(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedInAndIsAdmin("firmasoft_vehicle_groups", request, response);
	}

	@GetMapping("/point_settings")
	public String pointSettings(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedInAndIsAdminOrWatcher("firmasoft_point_settings", request, response);
	}

	@GetMapping("/region_settings")
	public String regionSettings(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedInAndIsAdminOrWatcher("firmasoft_region_settings", request, response);
	}

	@GetMapping("/route_settings")
	public String routeSettings(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedInAndIsAdminOrWatcher("firmasoft_route_settings", request, response);
	}

	@GetMapping("/support")
	public String support(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_support", request, response);
	}

	@GetMapping("/shift")
	public String shift(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_shift", request, response);
	}

	@GetMapping("/vehicle_personnels")
	public String firmasoft_vehicle_personnels(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_vehicle_personnels", request, response);
	}

	@GetMapping("/reset_password")
	public String reset_password(HttpServletRequest request) {
		return controlToken("firmasoft_reset_password", request);
	}

	@GetMapping("/test")
	public String test(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("test", request, response);
	}

	@GetMapping("mcResult")
	public String mcResult(HttpServletRequest request, HttpServletResponse response) {
		return "/mc/mcResult";
	}
	
	@GetMapping({ "/history" })
	public String history(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("firmasoft_history", request, response);
	}

	/********************  ***************************/
	@GetMapping("/reportsIframe")
	public String reportsIframe(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("report/iframe", request, response);
	}

	@GetMapping("/reportsOpen")
	public String reportsOpen(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("report/reportOpen", request, response);
	}

	@GetMapping("/reportsMailOpen")
	public String reportsMailOpen(HttpServletRequest request, HttpServletResponse response) {
		return controlLogedIn("report/reportsMailOpen", request, response);
	}

	private String controlLogedIn(String page, HttpServletRequest request, HttpServletResponse response) {
		CookieResponseDto dto = cookieService.isCookie(request, response, true);
		if (dto.isLoggedIn())
			return page;
		return "firmasoft_login";

	}

	private String controlToken(String page, HttpServletRequest request) {
		String token = request.getParameter("token");
		User user = userService.getUserByToken(token);

		if (user == null) {
			return "firmasoft_login";
		} else {
			/*Date d = user.getPwdchg_token_expire_date();
			Date today = new Date();
			if (today.after(d)) {
				return "firmasoft_login";
			} else {*/
				return page;
			//}
		}
	}

	private String controlLogedInAndIsAdmin(String page, HttpServletRequest request, HttpServletResponse response) {
		CookieResponseDto dto = cookieService.isCookie(request, response, true);
		if (dto.isLoggedIn()) {
			if (utils.getUserPrivilege() == 1) {
				return page;
			}
		} else {
			return "firmasoft_login";
		}

		return "firmasoft_index";
	}

	private String controlLogedInAndIsAdminOrWatcher(String page, HttpServletRequest request,
			HttpServletResponse response) {
		CookieResponseDto dto = cookieService.isCookie(request, response, true);
		if (dto.isLoggedIn()) {
			return "firmasoft_login";
		}

		return "firmasoft_index";
	}

	@GetMapping("/eula")
	public String eula() {
		return "sozlesme/firmasoft_hizmet_sozlesmesi";
	}
	

	@GetMapping("index/searchAddress")
	public @ResponseBody Map<String, Object> searchAddressesViaKey(@RequestParam("key") String key) {
		logger.info("index/search starting method...");
		try { // By username and company
			List<DataSuggestionDto> list = commonService.searchAddressesViaKey(key, 5);

			return new ResponseUtil().createResponse(list, true, utils.translateText("success"));
		} catch (Exception e) {
			return new ResponseUtil().createResponse(null, false, e.getMessage());
		}
	}

	@GetMapping("index/setSession")
	public @ResponseBody Map<String, Object> getFavoriteReports(@RequestParam("key") String key,
			@RequestParam("val") String val) {
		logger.info("index/setSession starting method...");
		try {
			utils.setSessionVal(key, val);

			return new ResponseUtil().createResponse(null, true, utils.translateText("success"));
		} catch (Exception e) {
			return new ResponseUtil().createResponse(null, false, e.getMessage());
		}
	}

	@GetMapping("changeLang")
	public @ResponseBody Map<String, Object> changeLang(@RequestParam("lang") String lang) {
		// lang = lang.replace("%2F", "/");
		utils.setMes("i18/messages_" + lang);

		return new ResponseUtil().createResponse(null, true, utils.translateText("success"));
	}
	
	@GetMapping("index/bolgeList")
	public @ResponseBody Map<String, Object> getCustomerPointsGroupList() {
		logger.info("index/customerPointsGroupList starting method...");
		try {
			List<BolgeDto> list = bolgeService.getBolgeById(90L);

			return new ResponseUtil().createResponse(list, true, utils.translateText("success"));
		} catch (Exception e) {
			return new ResponseUtil().createResponse(null, false, e.getMessage());
		}
	}

	
}
