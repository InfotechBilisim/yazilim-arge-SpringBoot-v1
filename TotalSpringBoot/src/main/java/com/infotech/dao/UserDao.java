package com.infotech.dao;

import java.util.List;
import java.util.Map;

import com.infotech.dto.UsersDto;
import com.infotech.entity.User;

public interface UserDao {

	public List<User> getUsers();

	public List<User> getUsersByCurrentUserCompany();

	public User saveUser(User theUser);

	public User getUser(String theUsername);

	public User getCurrentUser();

	public void deleteUser(String theUsername);

	public User loginByUsernameAndPassword(String theUsername, String password);

	public User getUserByEmail(String email);

	public void sendPasswordToEmail(String email, User user,String lang,String param);

	public void logAppCheckActivation(String email, String imeiNo, String response, String remoteAddr);
	
	public void logApp(String company, String requestName,String username,String txt, String response, String remoteAddr);

	public boolean userControlByUsernameAndCompany(String email);

	public boolean addUserByEmailAndPasword(String email, String pass1);

	public Map<String, String> getUserGroups(String username);

	public List<UsersDto> getUsersDtoByCurentUserCompany();

	public User getUserByEmailAndUsername(String email, String username);

	public User getUserByToken(String token);

	boolean userControlByUsername(String username);

	boolean createUser(User user);

	/**
	 * @param msisdn
	 * @return
	 */
	public List<User> getByMsisdn(String msisdn);
}
