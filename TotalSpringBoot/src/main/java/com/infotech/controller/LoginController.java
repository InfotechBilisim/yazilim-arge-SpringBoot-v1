package com.infotech.controller;

/*
 * 
 * login_mode = 1 = Fast Login
 * login_mode = 2 = Username-pass login
 * 
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.annotation.SessionScope;

import com.infotech.config.Utils;
import com.infotech.dto.CookieResponseDto;
import com.infotech.dto.FastLoginDto;
import com.infotech.dto.FastLoginSDKDto;
import com.infotech.entity.User;
import com.infotech.service.CookieService;
import com.infotech.service.UserService;
import com.infotech.util.Base64Tools;
import com.infotech.util.ResponseUtil;

@Controller
@SessionScope
public class LoginController {

	private static final Logger logger = LogManager.getLogger(LoginController.class);
	
	@Autowired
	private Utils utils;
	@Autowired
	private UserService userService;


	@Autowired
	private MessageSource messageSource;

	@Autowired
	HttpSession session;

	@Value("${fastlogintokenendpoint}")
	private String fastlogintokenendpoint;

	@Value("${fastloginuserinfoendpoint}")
	private String fastloginuserinfoendpoint;

	/************************ Fast Login SDK ***********************************/
	@Value("${sdk_authentication_endpoint_URL}")
	private String sdk_authentication_endpoint_URL;
	/************************ Fast Login SDK ***********************************/

	@Autowired
	private CookieService cookieService;

	private boolean fastLoginProccesStarted = false;

	@GetMapping ({ "", "/", "/login" })
	public String login(HttpServletRequest request, HttpServletResponse response) {
		logger.info("Try login...");
		CookieResponseDto dto = cookieService.isCookie(request, response, false);
		if (dto.isLoggedIn())
			return "firmasoft_index";
		return "firmasoft_login";
	}

	@PostMapping("/index")
	public String showFormForUpdate(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("language") String language,
			@RequestParam("css") String css, @RequestParam("param") String param,
			@RequestParam("remember_me") String remember_me, @RequestParam("login_mode") String login_mode, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		if (login_mode.equals("1")) {
			String fastLoginErrorMsg = utils.getFastLoginErrorMsg();
			if (utils.getFastLoginUser() != null && fastLoginErrorMsg.equals("")) {
				User u = utils.getFastLoginUser();
				return doLoginOtherProcs(u.getUsername(), u.getPassword(), language, css, param,
						remember_me, model, request, response, u);
			} else {
				if (fastLoginErrorMsg.equals("") && fastLoginProccesStarted) {
					fastLoginErrorMsg = utils.translateText("fastLoginUnknownError", language);
				}
				model.addAttribute("message", fastLoginErrorMsg);
				utils.setFastLoginUser(null);
				fastLoginErrorMsg = "";
				fastLoginProccesStarted = false;
				return "firmasoft_login";
			}
		} else {
			if (username != null && password != null) {
				User user = userService.loginByUsernameAndPassword(username, password);
				if (user != null) {
					return doLoginOtherProcs(username, password, language, css, param, remember_me, model, request,
							response, user);
				}
			}
		}

		model.addAttribute("message", messageSource.getMessage("loginErrorMessage", null, new Locale(language)));
		return "firmasoft_login";
	}
	
	@PostMapping("/loginUrl")
	public String loginFromUrl(@RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("language") String language,
			@RequestParam("param") String param,
			Model model,HttpServletRequest request, HttpServletResponse response) {
		
		if(language ==null || language.equals("") ) {
			language="tr";
		}
		
		String css = "resources/assets/styles/css/base.css";
		String res = "i18/messages_" + language;
		
		if(param==null) {
			return "firmasoft_login";
		} else {
			if(param.equals("bm")) {
				css = "resources/assets/styles/css/base_bm.css";
				res = "i18/messages_bm_" + language;
			} else if(param.equals("locate")) {
				css = "resources/assets/styles/css/base_locate.css";
				res = "i18/messages_locate_" + language;
			} else if(param.equals("turpak")) {
				css = "resources/assets/styles/css/base_turpak.css";
				res = "i18/messages_turpak_" + language;
			} else if(param.equals("sis")) {
				css = "resources/assets/styles/css/base_sis.css";
				res = "i18/messages_sis_" + language;
			} else if(param.equals("kopilot")) {
				css = "resources/assets/styles/css/base_kopilot.css";
				res = "i18/messages_kopilot_" + language;
			}
		}
		
		utils.get().setMes(res);
		
		if (username != null && password != null) {
			User user = userService.loginByUsernameAndPassword(username, password);
			if (user != null) {
				return doLoginOtherProcs(username, password, language, css, param, "no", model, request,
					response, user);
				//return "firmasoft_index";
			}
		}
		
		System.out.println("e");
		return null;
	
	}

	private String doLoginOtherProcs(String username, String password, String language, String css, String param,
			String remember_me, Model model, HttpServletRequest request, HttpServletResponse response, User user) {
/*		if (user.getActive_flag() == null || user.getActive_flag() != 1) {
			model.addAttribute("message", messageSource.getMessage("userActivetinMsg", null, new Locale(language)));
			return "firmasoft_login";
		}
*/
	/*	Company c = userService.getCompany(user.getCompany());
		if (c == null || c.getCompany_in_use() != 1) {
			model.addAttribute("message",
					messageSource.getMessage("userCompanyInUseControlMsg", null, new Locale(language)));
			return "firmasoft_login";
		}
*/
		utils.clear();
		session.removeAttribute("user");
		session.removeAttribute("language");
		session.removeAttribute("css");
		session.removeAttribute("param");
		session.setAttribute("user", user);
		session.setAttribute("css", css);
		session.setAttribute("param", param);
		session.setAttribute("language", language);
		session.setAttribute("activation-time", System.currentTimeMillis());

		if (remember_me.equals("on")) {
			cookieService.createCookie(username, password, css, language, param, response);
		} else {
			cookieService.clearCookie(response, request);
		}
		return "firmasoft_index";
	}

	@GetMapping("/loginform")
	public String showForm() {
		return "login";
	}

	@PostMapping("/rememberPassword")
	public void rememberPassword(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();

			String email = request.getParameter("forgot_password_email").trim();

			if (!utils.validateMail(email)) {
				out.print("invalidMailAdr");
				return;
			}

			String username = request.getParameter("forgot_password_username").trim();
			User user = userService.getUserByEmailAndUsername(email, username);

			if (user != null) {
				if (!emailCorrection(user.getEmail(), email)) {
					System.out.println("invalid mail");
					out.print("fail");
				} else {
					// sifreyi mail at
					System.out.println("send password | | " + user.getUsername() + " - " + user.getPassword());

					out.print("success");
				}
			} else {
				System.out.println("invalid mail");
				out.print("fail");
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@PostMapping("/rememberPassword2")
	public void rememberPassword2(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();

			String email = request.getParameter("forgot_password_email").trim();
			String lang = request.getParameter("lang").trim();
			String param = request.getParameter("param").trim();

			if (!utils.validateMail(email)) {
				out.print("invalidMailAdr");
				return;
			}

			String username = request.getParameter("forgot_password_username").trim();
			User user = userService.getUserByEmailAndUsername(email, username);

			if (user != null) {
				if (!emailCorrection(user.getEmail(), email)) {
					System.out.println("invalid mail");
					out.print("fail");
				} else {
					userService.sendPasswordToEmail(email, user, lang, param);
					out.print("success");
				}
			} else {
				System.out.println("invalid mail");
				out.print("fail");
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@PostMapping("/resetPassword")
	public void resetPassword(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();

			String password = request.getParameter("password").trim();
			String token = request.getParameter("token").trim();

			User user = userService.getUserByToken(token);
			new Date();

			if (user != null) {
				/*if (today.after(user.getPwdchg_token_expire_date())) {
					out.print("tokenExpire");
				} else {*/
					user.setPassword(password);
					//user.setPwdchg_token(null);
					//user.setPwdchg_language(null);
					//user.setPwdchg_css(null);
					//user.setPwdchg_token_expire_date(null);
					User editedUser = userService.saveUser(user);

					if (editedUser != null) {
						out.print("success");
					} else {
						out.print("fail");
					}

				//}
			} else {
				out.print("userTokenError");
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static boolean emailCorrection(String emailDb, String emailParam) {
		boolean emailReturn = false;
		emailDb = emailDb.replaceAll(",", ";");
		String emailList[] = emailDb.split(";");
		for (int i = 0; i < emailList.length; i++) {
			if (emailList[i].contains(emailParam)) {
				emailReturn = true;
				break;
			}
		}
		return emailReturn;
	}

	@PostMapping("changeLang")
	public @ResponseBody Map<String, Object> changeLang(@RequestParam("lang") String lang,
			@RequestParam("param") String param) {

		try {
			session.setAttribute("lang", lang);
			utils.setMes("i18/messages_" + param + "_" + lang);

			return new ResponseUtil().createResponse(null, true, utils.translateText("success"));
		} catch (Exception e) {
			return new ResponseUtil().createResponse(null, false, "Bilinmeyen bir hata oluştu");
		}
	}

	@RequestMapping(value = "fast_login_sdk", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> fastLoginRegisterSDK(@RequestBody FastLoginSDKDto dto,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("fast_login starting method...");
		userService.logApp("", "fast_login", "", "fast_login starting method...", "", request.getRemoteAddr());
		try {
			fastLoginProccesStarted = true;
			String fastLoginErrorMsg = "";
			utils.setFastLoginUser(null);

			if (dto.getResultCode() != null && !dto.getResultCode().equals("") && !dto.getResultCode().equals("null")
					&& !dto.getResultCode().equals("0")) {
				return new ResponseUtil().createResponse(null, false,
						URLDecoder.decode(dto.getResultMessage(), StandardCharsets.UTF_8.name()));
			}

			getMsisdnFromFastLoginValidationService(dto.getToken());
			
			String err = utils.getFastLoginErrorMsg();
			if(!err.equals("")) {
				userService.logApp("", "fast_login", "", "fast_login oturum açma başarısız oldu : " + err, "",
						request.getRemoteAddr());
				return new ResponseUtil().createResponse(null, false, err);
			}
			
			fastLoginErrorMsg = "";
			utils.setFastLoginErrorMsg(fastLoginErrorMsg);
			userService.logApp("", "fast_login", "", "fast_login oturum açma başarısız oldu", "",
					request.getRemoteAddr());
			return new ResponseUtil().createResponse(null, false, utils.translateText("fastLoginUnknownError"));
		} catch (Exception e) {
			// userService.logApp("","fast_login","",e.getMessage(),"",
			return new ResponseUtil().createResponse(null, false, e.getMessage());
		}
	}

	@RequestMapping(value = "fast_login", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> fastLoginRegister(@RequestBody FastLoginDto dto,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("fast_login starting method...");
		userService.logApp("", "fast_login", "", "fast_login starting method...", "", request.getRemoteAddr());
		try {
			fastLoginProccesStarted = true;
			String fastLoginErrorMsg;
			utils.setFastLoginUser(null);

			if (dto.getRet_error() != null && !dto.getRet_error().equals("") && !dto.getRet_error().equals("null")) {
				fastLoginErrorMsg = utils.translateText(dto.getRet_error());
				utils.setFastLoginErrorMsg(fastLoginErrorMsg);
				return new ResponseUtil().createResponse(null, false, fastLoginErrorMsg);
			}

			getMcToken(dto.getRet_code());

		
			fastLoginErrorMsg = "";
			utils.setFastLoginErrorMsg(fastLoginErrorMsg);
			userService.logApp("", "fast_login", "", "fast_login oturum açma başarısız oldu", "",
					request.getRemoteAddr());
			return new ResponseUtil().createResponse(null, false, utils.translateText("fastLoginUnknownError"));
		} catch (Exception e) {
			// userService.logApp("","fast_login","",e.getMessage(),"",
			// request.getRemoteAddr());
			return new ResponseUtil().createResponse(null, false, e.getMessage());
		}
	}

	public String getMsisdnFromFastLoginValidationService(String loginToken) {
		URL url = null;
		HttpURLConnection http = null;
		OutputStream out = null;
		InputStream inp = null;
		String fastLoginErrorMsg;

		String retVal = "";
		try {
			//String urltext = sdk_authentication_endpoint_URL;
			url = new URL("https://fastlogin.com.tr/fastlogin_app/secure/validate.json");
			http = (HttpURLConnection) url.openConnection();
			http.setDoOutput(true);
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type", "application/json");
			http.setRequestProperty("ServiceId", "application/json");
			http.setRequestProperty("cache-control", "no-cache");
			http.setRequestProperty("Accept",
					"text/plain, application/json, application/json, application/*+json, application/*+json, text/plain, */*, */*");

			String sdk_fastloginSecretKey = utils.translateText("sdk_fastloginSecretKey");
			String sdk_fastLoginServiceId = utils.translateText("sdk_fastLoginServiceId");
			
			String datajson = "{\"serviceId\": \"" + sdk_fastLoginServiceId + "\",\"secretKey\": \""
					+ sdk_fastloginSecretKey + "\",\"loginToken\": \"" + loginToken + "\"}";

			http.setDoInput(true);
			http.connect();

			out = http.getOutputStream();
			out.write(datajson.getBytes());

			inp = http.getInputStream();
			int code = http.getResponseCode();
			if (code != 200) {
				fastLoginErrorMsg = utils.translateText("fastLoginOauthError");
				utils.setFastLoginErrorMsg(fastLoginErrorMsg);
				logger.error(fastLoginErrorMsg);
				return fastLoginErrorMsg;
			}

			String result = "";
			byte[] b = new byte['?'];
			int length;
			for (;;) {
				length = inp.read(b, 0, b.length);
				if (length < 0) {
					break;
				}
				result = result + new String(b, 0, length);
			}
			result = result.trim();

			JSONObject obj = new JSONObject(result);
			JSONObject resultStatus = obj.getJSONObject("resultStatus");
			int resultCode = resultStatus.getInt("resultCode");

			if (resultCode == 0) {
				retVal = obj.getString("msisdn");
			} else {
				fastLoginErrorMsg = resultStatus.getString("resultMessage");
				utils.setFastLoginErrorMsg(fastLoginErrorMsg);
				logger.error(fastLoginErrorMsg);
				return fastLoginErrorMsg;
			}

		} catch (Exception ex) {
			fastLoginErrorMsg = utils.translateText("fastLoginUnknownError");
			utils.setFastLoginErrorMsg(fastLoginErrorMsg);
			logger.error(fastLoginErrorMsg + ": " + ex);
			ex.printStackTrace();
		}

		return retVal;
	}

	public String getMcToken(String authorizationCode) {
		URL url = null;
		HttpURLConnection http = null;
		OutputStream out = null;
		InputStream inp = null;
		String encoding = null;
		
		String fastLoginErrorMsg = "";

		String clientId = utils.translateText("fastloginClientId");
		String clientSecret = utils.translateText("fastloginSecretKey");

		encoding = Base64Tools.encodeString(clientId + ":" + clientSecret);

		String retVal = "";
		try {
			url = new URL(fastlogintokenendpoint);
			http = (HttpURLConnection) url.openConnection();
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			http.setRequestProperty("Authorization", "Basic " + encoding);
			http.setRequestProperty("Accept",
					"text/plain, application/json, application/json, application/*+json, application/*+json, text/plain, */*, */*");
			http.setRequestProperty("cache-control", "no-cache");
			http.setRequestProperty("Authorizationcode", authorizationCode);
			http.setRequestProperty("grant_type", "authorization_code");
			String data = "grant_type=authorization_code&code=" + authorizationCode + "&redirect_uri="
					+ utils.translateText("fastRedirectUri");

			http.setDoOutput(true);
			http.setDoInput(true);
			http.connect();

			out = http.getOutputStream();
			out.write(data.getBytes());

			inp = http.getInputStream();
			int code = http.getResponseCode();
			if (code != 200) {
				fastLoginErrorMsg = utils.translateText("fastLoginOauthError");
				utils.setFastLoginErrorMsg(fastLoginErrorMsg);
				logger.error(fastLoginErrorMsg);
				return fastLoginErrorMsg;
			}

			String result = "";
			byte[] b = new byte['?'];
			int length;
			for (;;) {
				length = inp.read(b, 0, b.length);
				if (length < 0) {
					break;
				}
				result = result + new String(b, 0, length);
			}

			JSONObject jsonObj = new JSONObject(result);
			String p_tokenId = jsonObj.getString("id_token");
			String access_token = jsonObj.getString("access_token");

			if (p_tokenId == null || p_tokenId.equals("")) {
				fastLoginErrorMsg = utils.translateText("fastLoginUserInfoError");
				utils.setFastLoginErrorMsg(fastLoginErrorMsg);
				logger.error(fastLoginErrorMsg);
				return fastLoginErrorMsg;
			}

			/* *************** Get User Info Request boom****** */
			/*
			 * Userinfo End Poingt URL: https://hizligiris.com.tr/hizligiris/userinfo
			 * 
			 */

			url = new URL(fastloginuserinfoendpoint);
			http = (HttpURLConnection) url.openConnection();
			http.setRequestMethod("GET");
			http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			http.setRequestProperty("Accept", "application/json");
			http.setRequestProperty("Access-Control-Allow-Origin", "mobcon.turkcell.com.tr");
			http.setRequestProperty("Authorization", "Bearer " + access_token);

			http.setDoOutput(false);
			http.setDoInput(true);
			http.connect();

			inp = http.getInputStream();
			code = http.getResponseCode();
			if (code != 200) {
				fastLoginErrorMsg = utils.translateText("fastLoginOauthError");
				utils.setFastLoginErrorMsg(fastLoginErrorMsg);
				logger.error(fastLoginErrorMsg);
				return fastLoginErrorMsg;
			}

			BufferedReader in = new BufferedReader(new InputStreamReader(http.getInputStream()));
			String line;
			StringBuffer response = new StringBuffer();

			while ((line = in.readLine()) != null) {
				response.append(line);
			}

			jsonObj = new JSONObject(response.toString());
			boolean phone_number_verified = jsonObj.getBoolean("phone_number_verified");
			if (phone_number_verified) {
				retVal = jsonObj.getString("phone_number");
			} else {
				fastLoginErrorMsg = utils.translateText("fastLoginUserInfoError");
				utils.setFastLoginErrorMsg(fastLoginErrorMsg);
				logger.error(fastLoginErrorMsg);
				return fastLoginErrorMsg;
			}

		} catch (Exception ex) {
			fastLoginErrorMsg = utils.translateText("fastLoginUnknownError");
			utils.setFastLoginErrorMsg(fastLoginErrorMsg);
			logger.error(fastLoginErrorMsg + " : " + ex);
			ex.printStackTrace();
		}

		return retVal;
	}

}
