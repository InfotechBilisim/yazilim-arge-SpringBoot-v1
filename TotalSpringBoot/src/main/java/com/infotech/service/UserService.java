package com.infotech.service;

import java.util.List;
import java.util.Map;

import com.infotech.dto.UsersDto;
import com.infotech.entity.ColumnContentDef;
import com.infotech.entity.User;

public interface UserService {

	public List<User> getUsers();
	
	public List<User> getUsersByCurrentUserCompany();
	
	public User saveUser(User theUser);

	public User getUser(String theUsername);
	
	public User getCurrentUser();

	public void deleteUser(String theUsername);
	
    public User loginByUsernameAndPassword(String theUsername,String password);

	public User getUserByEmail(String email);

	//public void sendPasswordToEmail(String email, String username, String password);

	public void logAppCheckActivation(String email, String imeiNo, String response, String remoteAddr);
	
	public void logApp(String company, String requestName,String username,String txt, String response, String remoteAddr);

	public boolean userControlByUsernameAndCompany(String email);

	public boolean addUserByEmailAndPasword(String email, String pass1);

	public Map<String, String> getUserGroups(String username);
	
	public List<ColumnContentDef> getUserPrivilegeList();
	
	public List<UsersDto> getUsersDtoByCurentUserCompany();

	public User getUserByEmailAndUsername(String email, String username);

	public List<ColumnContentDef> getColumnContentDef(String label_name, String data_column_name);

	public boolean userCompanyInUseControl(String company);

	public void sendPasswordToEmail(String email, User user,String lang,String param);

	public User getUserByToken(String token);
	
	public boolean userControlByUsername(String username);
	
	public boolean createUser(User user);



}
