package com.infotech.dao;

import java.security.SecureRandom;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infotech.config.Utils;
import com.infotech.dto.UsersDto;
import com.infotech.entity.AppLog;
import com.infotech.entity.Outbox;
import com.infotech.entity.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	private static final Logger logger = LogManager.getLogger(UserDaoImpl.class);
	@Autowired
	private Utils utils;
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	HttpSession sessionHttp;

	User user = null;

	@Override
	public List<User> getUsers() {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<User> cq = cb.createQuery(User.class);
		Root<User> root = cq.from(User.class);
		cq.select(root);
		Query query = session.createQuery(cq);
		return query.getResultList();
	}

	@Override
	public User saveUser(User theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		User user = (User) currentSession.merge(theUser);
		return user;
	}

	@Override
	public User getUser(String theUsername) {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = currentSession.get(User.class, theUsername);
		return theUser;
	}

	@Override
	public User getCurrentUser() {
		Session currentSession = sessionFactory.getCurrentSession();
		User theUser = currentSession.get(User.class, utils.getUsername());
		return theUser;
	}

	@Override
	public void deleteUser(String theUsername) {
		if (theUsername != null) {
			Session currentSession = sessionFactory.getCurrentSession();
			if (controlUserCompany(theUsername)) {
				User user = new User();
				user.setUsername(theUsername);
				currentSession.merge(user);
			}
		}
	}

	/**
	 * Silinmek istenen user ile silme istegi yapan user companyleri karsilastirilir
	 * 
	 * @param username
	 * @return
	 */
	private boolean controlUserCompany(String username) {

		User deleteReq = getUser(username);

		if (deleteReq.getCompany().equals(utils.getUserCompany())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public User loginByUsernameAndPassword(String theUsername, String password) {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();

		CriteriaQuery<User> criteriaQuery = builder.createQuery(User.class);
		Root<User> root = criteriaQuery.from(User.class);
		// Root<Company> cRoot = criteriaQuery.from(Company.class);

		ParameterExpression<String> paramUsername = builder.parameter(String.class);
		ParameterExpression<String> paramPassword = builder.parameter(String.class);
		// ParameterExpression<Long> paramActiveFlag = builder.parameter(Long.class);

		criteriaQuery.select(root).where(builder.equal(root.get("username"), paramUsername),
				builder.equal(root.get("password"), paramPassword)
		// ,builder.equal(root.get("active_flag"), paramActiveFlag)
		// ,builder.equal(root.get("company"), cRoot.get("company"))
		// ,builder.equal(cRoot.get("company_in_use"), 1)
		);

		TypedQuery<User> query = session.createQuery(criteriaQuery);
		query.setParameter(paramUsername, theUsername);
		query.setParameter(paramPassword, password);
		// query.setParameter(paramActiveFlag, 1L);

		try {
			User user = (User) query.getSingleResult();
			return user;
		} catch (NoResultException nre) {
			logger.error("Catched Error No ResultException->" + nre.getMessage());
			return null;
		}

	}

	@Override
	public List<User> getUsersByCurrentUserCompany() {
		Session session = sessionFactory.getCurrentSession();

		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<User> userQuery = cb.createQuery(User.class);
		Root<User> root = userQuery.from(User.class);
		userQuery.where(cb.equal(root.get("company"), utils.getUserCompany()));
		// userQuery.select(root);
		Query query = session.createQuery(userQuery);
		return query.getResultList();
	}

	@Override
	public List<UsersDto> getUsersDtoByCurentUserCompany() {
		Session session = sessionFactory.getCurrentSession();

		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<UsersDto> userQuery = cb.createQuery(UsersDto.class);
		Root<User> root = userQuery.from(User.class);
		userQuery.select(cb.construct(UsersDto.class, root.get("username"), root.get("uname"), root.get("usurname"),
				root.get("company")));
		userQuery.orderBy(cb.asc(root.get("username")), cb.desc(root.get("uname")));
		userQuery.where(cb.equal(root.get("company"), utils.getUserCompany()));
		// userQuery.select(root);
		Query query = session.createQuery(userQuery);
		return query.getResultList();
	}

	@Override
	public User getUserByEmail(String email) {

		System.out.println("param mail:" + email);
		Session currentSession = sessionFactory.getCurrentSession();

		CriteriaBuilder cb = currentSession.getCriteriaBuilder();
		CriteriaQuery<User> userQuery = cb.createQuery(User.class);
		Root<User> root = userQuery.from(User.class);
		userQuery.where(cb.equal(root.get("email"), email));
		Query query = currentSession.createQuery(userQuery);
		System.out.println("result:" + query.getFirstResult());
		List<User> userList = query.getResultList();
		/*
		 * for(int i=0;i<userList.size();i++) { User user = userList.get(i);
		 * System.out.println("Username:" + user.getUsername());
		 * System.out.println("Password:" + user.getPassword()); }
		 */
		if (userList.size() == 1) {
			User user = userList.get(0);
			System.out.println("user:" + user);
			if (user != null) {
				return user;
			} else {
				return null;
			}
		} else {
			return null;
		}

		// User theUser = currentSession.get(User.class, email);
		// return theUser;
	}

	@Override
	public User getUserByEmailAndUsername(String email, String username) {
		Session currentSession = sessionFactory.getCurrentSession();

		CriteriaBuilder cb = currentSession.getCriteriaBuilder();
		CriteriaQuery<User> userQuery = cb.createQuery(User.class);
		Root<User> root = userQuery.from(User.class);
		userQuery.where(cb.like(cb.upper(root.get("email")), "%" + email.toUpperCase(Locale.ROOT) + "%"),
				cb.equal(root.get("username"), username));
		Query query = currentSession.createQuery(userQuery);
		System.out.println("result:" + query.getFirstResult());
		List<User> userList = query.getResultList();

		if (userList.size() == 1) {
			User user = userList.get(0);
			System.out.println("user:" + user);
			if (user != null) {
				return user;
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.infotech.dao.UserDao#sendPasswordToEmail(java.lang.String,
	 *      java.lang.String, java.lang.String) Kullanýcýya sifre hatýrlatma maili
	 *      icin,outboxa kayýt girilen metoddur
	 * @author izzetköse
	 */
	@Override
	public void sendPasswordToEmail(String email, User user, String lang, String param) {
		Session currentSession = sessionFactory.getCurrentSession();
		String mess = utils.translateText("username") + ": " + user.getUsername() + ", "
				+ utils.translateText("password") + ": " + user.getPassword();

		String link;

		if (param.equals("infomobil")) {
			link =utils.translateText("infomobilUrl");
		} else if (param.equals("bm")) {
			link = utils.translateText("bmUrl");
		} else {
			link = utils.translateText("locateUrl");
		}

		String token = randomNumber();
		link = link + "?token=" + token;
		/*user.setPwdchg_css(param);
		user.setPwdchg_language(lang);
		user.setPwdchg_token(token);*/

		Date dt = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(dt);
		c.add(Calendar.DATE, 1);
		dt = c.getTime();

		//user.setPwdchg_token_expire_date(dt);
		currentSession.update(user);

		Date today = new Date();
		Outbox outbox = new Outbox();
		outbox.setGateway("EMAIL");
		outbox.setDestination(email);
		outbox.setData("|" + utils.translateText("changePass") + "|?" + link);
		outbox.setTimeStamp(today);
		outbox.setProcessStatus(0);
		outbox.setGeneratorRowNo(0);
		outbox.setProcessTimeStamp(today);
		outbox.setProcessModuleName("WEB");
		outbox.setProcessModuleInstance(1);
		currentSession.save("Outbox", outbox);
	}

	@Override
	public void logAppCheckActivation(String email, String imeiNo, String response, String remoteAddr) {

		Session currentSession = sessionFactory.getCurrentSession();
		Date today = new Date();
		AppLog appLog = new AppLog();
		appLog.setAppName("INFOMOBIL_PRO");
		appLog.setClientIp(remoteAddr);
		appLog.setCompany(email);
		appLog.setRequestName("checkActivation");
		appLog.setUsername(email);
		appLog.setTxt("imeiNo:" + imeiNo);
		appLog.setResponse(response);
		appLog.setTimeStamp(today);
		currentSession.save("AppLog", appLog);

	}
	
	@Override
	public void logApp(String company, String requestName,String username,String txt, String response, String remoteAddr) {

		Session currentSession = sessionFactory.getCurrentSession();
		Date today = new Date();
		AppLog appLog = new AppLog();
		appLog.setAppName("INFOMOBIL_PRO");
		appLog.setClientIp(remoteAddr);
		appLog.setCompany(company);
		appLog.setRequestName(requestName);
		appLog.setUsername(username);
		appLog.setTxt(txt);
		appLog.setResponse(response);
		appLog.setTimeStamp(today);
		currentSession.save("AppLog", appLog);

	}

	@Override
	public boolean userControlByUsernameAndCompany(String email) {
		Session currentSession = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = currentSession.getCriteriaBuilder();
		CriteriaQuery<User> userQuery = cb.createQuery(User.class);
		Root<User> root = userQuery.from(User.class);
		userQuery.where(cb.equal(root.get("username"), email), cb.equal(root.get("company"), email));
		Query query = currentSession.createQuery(userQuery);
		System.out.println("result:" + query.getFirstResult());
		List<User> userList = query.getResultList();

		if (userList != null && userList.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean userControlByUsername(String username) {
		Session currentSession = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = currentSession.getCriteriaBuilder();
		CriteriaQuery<User> userQuery = cb.createQuery(User.class);
		Root<User> root = userQuery.from(User.class);
		userQuery.where(cb.equal(root.get("username"), username));
		Query query = currentSession.createQuery(userQuery);
		System.out.println("result:" + query.getFirstResult());
		List<User> userList = query.getResultList();

		if (userList != null && userList.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean addUserByEmailAndPasword(String email, String pass1) {
		Session currentSession = sessionFactory.getCurrentSession();
		try {
			User user = new User();
			user.setUsername(email);
			user.setEmail(email);
			user.setCompany(email);
			user.setPassword(pass1);
			user.setPrivilege(7L);
			currentSession.save("User", user);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean createUser(User user) {
		Session currentSession = sessionFactory.getCurrentSession();
		try {
			currentSession.save("User", user);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Map<String, String> getUserGroups(String username) {
		Map<String, String> groupList = new HashMap<String, String>();
		Session session = sessionFactory.getCurrentSession();

		String sql = "select groupname from USERS_GROUP where username=:username order by groupname ";

		List<Object> object = session.createNativeQuery(sql).setParameter("username", username).list();

		if (object != null && object.size() > 0) {
			for (int i = 0; i < object.size(); i++) {
				groupList.put(object.get(i).toString(), object.get(i).toString());

			}
		}
		return groupList;
	}

	public String randomNumber() {
		SecureRandom random = new SecureRandom(); // Get the real random seed from /dev/random
		int max = 999999;
		int min = 99999;

		System.out.println(random.nextInt(max - min + 1) + min);

		int rn = random.nextInt(max - min + 1) + min;
		return String.valueOf(rn);
	}

	@Override
	public User getUserByToken(String token) {
		Session currentSession = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = currentSession.getCriteriaBuilder();
		CriteriaQuery<User> userQuery = cb.createQuery(User.class);
		Root<User> root = userQuery.from(User.class);
		userQuery.where(cb.equal(root.get("pwdchg_token"), token));
		Query query = currentSession.createQuery(userQuery);
		System.out.println("result:" + query.getFirstResult());
		List<User> userList = query.getResultList();
		if (userList.size() == 1) {
			User user = userList.get(0);
			System.out.println("user:" + user);
			if (user != null) {
				return user;
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	@Override
	public List<User> getByMsisdn(String msisdn) {
		Session currentSession = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = currentSession.getCriteriaBuilder();
		CriteriaQuery<User> userQuery = cb.createQuery(User.class);
		Root<User> root = userQuery.from(User.class);
		userQuery.where(cb.equal(root.get("msisdn"), msisdn));
		Query query = currentSession.createQuery(userQuery);

		List<User> userList = query.getResultList();
		return userList;
	}

}
