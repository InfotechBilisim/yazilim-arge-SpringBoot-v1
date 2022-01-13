package com.infotech.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infotech.dao.ColumnContentDefDao;
import com.infotech.dao.UserDao;
import com.infotech.dto.UsersDto;
import com.infotech.entity.ColumnContentDef;
import com.infotech.entity.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;


	@Autowired
	private ColumnContentDefDao columnContentDefDao;

	@Override
	public List<User> getUsers() {
		return userDao.getUsers();
	}

	@Override
	public List<User> getUsersByCurrentUserCompany() {
		return userDao.getUsersByCurrentUserCompany();
	}

	@Override
	public User saveUser(User theUser) {
		User user = userDao.saveUser(theUser);
		return user;
	}

	@Override
	public User getUser(String theUsername) {
		return userDao.getUser(theUsername);
	}

	@Override
	public User getCurrentUser() {
		return userDao.getCurrentUser();
	}

	@Override
	public void deleteUser(String theUsername) {
		userDao.deleteUser(theUsername);
	}

	@Override
	public User loginByUsernameAndPassword(String theUsername, String password) {
		User user = null;
		if (theUsername != null && password != null) {
			theUsername = theUsername.trim();
			password = password.trim();
			user = userDao.loginByUsernameAndPassword(theUsername, password);
			return user;
		}

		return null;
	}

	@Override
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}

	@Override
	public User getUserByEmailAndUsername(String email, String username) {
		return userDao.getUserByEmailAndUsername(email, username);
	}

	@Override
	public void sendPasswordToEmail(String email, User user,String lang,String param) {
		userDao.sendPasswordToEmail(email, user,lang,param);
	}

	@Override
	public void logAppCheckActivation(String email, String imeiNo, String response, String remoteAddr) {
		userDao.logAppCheckActivation(email, imeiNo, response, remoteAddr);
	}
	
	@Override
	public void logApp(String company, String requestName,String username,String txt, String response, String remoteAddr) {
		userDao.logApp(company, requestName,username,txt, response, remoteAddr);
	}

	@Override
	public boolean userControlByUsernameAndCompany(String email) {
		boolean userExist = userDao.userControlByUsernameAndCompany(email);
		return userExist;
	}

	@Override
	public boolean addUserByEmailAndPasword(String email, String pass1) {
		boolean userCreation = userDao.addUserByEmailAndPasword(email, pass1);
		return userCreation;
	}

	@Override
	public Map<String, String> getUserGroups(String username) {
		Map<String, String> groupList = userDao.getUserGroups(username);
		return groupList;
	}

	public List<ColumnContentDef> getUserPrivilegeList() {
		return columnContentDefDao.getColumnContentDefList("USERS", "PRIVILEGE");
	}

	@Override
	public List<UsersDto> getUsersDtoByCurentUserCompany() {
		return userDao.getUsersDtoByCurentUserCompany();
	}

	@Override
	public List<ColumnContentDef> getColumnContentDef(String tableName, String columnName) {
		return columnContentDefDao.getColumnContentDefListOrderByValue(tableName, columnName);
	}

	@Override
	public User getUserByToken(String token) {
		return userDao.getUserByToken(token);
	}

	@Override
	public boolean userControlByUsername(String username) {
		return userDao.userControlByUsername(username);
	}

	@Override
	public boolean createUser(User user) {
		return userDao.createUser(user);
	}

	@Override
	public boolean userCompanyInUseControl(String company) {
		// TODO Auto-generated method stub
		return false;
	}
}
