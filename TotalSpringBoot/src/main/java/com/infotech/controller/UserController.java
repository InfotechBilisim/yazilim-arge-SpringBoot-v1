package com.infotech.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.infotech.config.Utils;
import com.infotech.dto.UsersDto;
import com.infotech.entity.ColumnContentDef;
import com.infotech.entity.ComboView;
import com.infotech.entity.User;
import com.infotech.service.UserService;
import com.infotech.util.ResponseUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LogManager.getLogger(UserController.class);
	@Autowired
	private Utils utils;
	@Autowired
	private UserService userService;

	Map<String, String> privilegesList = null;

	@GetMapping("/list")
	public String listUsers(Model theModel) {
		List<User> theUsers = userService.getUsers();
		theModel.addAttribute("users", theUsers);
		return "list-users";
	}

	@GetMapping("/showForm")
	public String showFormForAdd(Model theModel) {
		User theUser = new User();
		theModel.addAttribute("user", theUser);
		return "user-form";
	}

	@PostMapping("/saveUser2")
	public String saveUser(@ModelAttribute("user") User theUser) {
		logger.info(theUser.toString());
		// userService.saveUser(theUser);
		return "redirect:/user/list";
	}

	@GetMapping("/updateForm")
	public String showFormForUpdate(@RequestParam("theUsername") String theUsername, Model theModel) {
		User theUser = userService.getUser(theUsername);
		theModel.addAttribute("user", theUser);
		return "user-form";
	}

	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("theUsername") String theUsernameId) {
		userService.deleteUser(theUsernameId);
		return "redirect:/user/list";
	}

	@RequestMapping(value = "getUserData", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> getCurrentUserData() {
		logger.info("GET getUserData method starting");
		User user = new User();
		try {
			user = userService.getCurrentUser();
			user.setPassword(""); // Fronted, yani kullanıcıların gördüğü taraf şifre gitmemelidir.
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseUtil().createResponse(user, false, e.getMessage());
		}

		return new ResponseUtil().createResponse(user, true, utils.translateText("success"));
	}

	@RequestMapping(value = "getCompanyUsers", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> getCompanyUsers() {
		logger.info("GET getCompanyUsers method starting");
		try {
			List<UsersDto> users = userService.getUsersDtoByCurentUserCompany();
			return new ResponseUtil().createResponse(users, true, utils.translateText("success"));
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseUtil().createResponse(null, false, e.getMessage());
		}
	}


	@RequestMapping(value = "delete_by_username", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> deleteByUsername(@RequestBody String username) {
		logger.info("GET delete_by_username method starting");
		try {
			userService.deleteUser(username);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseUtil().createResponse(null, false, e.getMessage());
		}

		return new ResponseUtil().createResponse(null, true, utils.translateText("success"));
	}

	@RequestMapping(value = "privilegesComboList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getUserPrivilegeList() {
		try {
			List<ColumnContentDef> userPrivilegeList = userService.getUserPrivilegeList();

			List<ComboView> listCombo = new ArrayList<ComboView>();

			for (int i = 0; i < userPrivilegeList.size(); i++) {
				ColumnContentDef dto = userPrivilegeList.get(i);
				ComboView combo = new ComboView();
				String translate =utils.translateText(dto.getColumnDef());
				combo.setLabel(translate);
				combo.setValue(dto.getColumnValue());
				listCombo.add(combo);
			}
			return new ResponseUtil().createResponse(listCombo, true, utils.translateText("success"));

		} catch (Exception e) {
			logger.error(e.getMessage());
			return new ResponseUtil().createResponse(null, false, e.getMessage());
		}
	}
}
