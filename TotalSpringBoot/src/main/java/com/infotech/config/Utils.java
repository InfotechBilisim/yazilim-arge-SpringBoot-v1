package com.infotech.config;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.net.URI;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

import com.infotech.dao.ResourceManager;
import com.infotech.dto.DatePickerFormatDto;
import com.infotech.entity.User;
import com.infotech.profile.UserInfo;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Utils implements  Serializable, Cloneable {

	private static final long serialVersionUID = 1L;

	private static final Logger logger = LogManager.getLogger(Utils.class);
	
	@Value("${version2}")
	private String version;

	@Autowired
	private ApplicationContext context;

	@Autowired
	private HttpSession sessionHttp;

	@Autowired
	private MessageSource messageSource;


	private Utils util = null;

	String dateFormat = "dd.MM.yyyy HH:mm";

	public void createIt(String className) {
		try {

			className = className + "Dao";

			java.net.URL URL = ResourceManager.class.getResource("ResourceManager.class");
			String url = URL.getPath();
			url = url.substring(0, url.indexOf("/Total_Spring"));
			url = url + "/Total_Spring/src/com/infotech/dao/";
			System.out.println(url);

			createDao(url, className);
			createDaoImpl(url, className);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void createDao(String url, String className) {
		File file = new File(url, className + ".java");

		FileWriter aWriter = null;
		try {
			aWriter = new FileWriter(file);
			aWriter.write("package com.infotech.dao; \n");

			aWriter.write("public interface " + className + "{\n");
			aWriter.write("}");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (aWriter != null) {
				try {
					aWriter.flush();
					aWriter.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	public void createDaoImpl(String url, String className) {
		File file = new File(url, className + "Impl" + ".java");

		FileWriter aWriter = null;
		try {
			aWriter = new FileWriter(file);
			aWriter.write("package com.infotech.dao; \n");
			aWriter.write("import org.springframework.stereotype.Repository;\n");
			aWriter.write("import org.springframework.transaction.annotation.Transactional;\n");
			aWriter.write("@Repository \n");
			aWriter.write("@Transactional\n");
			aWriter.write("public class " + className + "Impl" + " implements " + className + "{\n");
			aWriter.write("}");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (aWriter != null) {
				try {
					aWriter.flush();
					aWriter.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	public UserInfo getUserInfo() {
		UserInfo user = (UserInfo) context.getBean("UserInfo");
		return user;
	}

	public String getUsername() {
		try {
			User sessionUser = getSessionUser();
			return sessionUser.getUsername();
		} catch (Exception e) {

		} finally {
			// redirectToLogin();
		}
		return "";
	}

	public Long getUserPrivilege() {
		try {
			User sessionUser = getSessionUser();
			return sessionUser.getPrivilege();
		} catch (Exception e) {

		} finally {
			// redirectToLogin();
		}
		return 8L;// izleyici
	}

	public User getSessionUser() {
		User user = new User();
		if (sessionHttp != null) {
			user = (User) sessionHttp.getAttribute("user");
			if (user == null) {
				// redirectToLogin();
			}
		}
		return user;
	}

	public void setSessionUser(User user) {
		sessionHttp.setAttribute("user", user);
	}

	public String getUserCompany() {
		try {
			User user = getSessionUser();
			return user.getCompany();
		} catch (Exception e) {
		} finally {
			// redirectToLogin();
		}
		return null;

	}

	public String getUserEmail() {
		try {
			User user = getSessionUser();
			return user.getEmail();
		} catch (Exception e) {
		} finally {
			// redirectToLogin();
		}
		return null;

	}

	public Utils get() {
		if (util == null)
			util = new Utils();

		return util;
	}

	public String getUserLanguage() {
		Object attribute = sessionHttp.getAttribute("language");
		String lang = attribute != null ? attribute.toString() : "tr";
		return lang;
	}

	public String translateText(String text) {
		if (messageSource != null) {
			String t = messageSource.getMessage(text, null, new Locale(getUserLanguage()));
			return t;
		}
		return text;
	}

	public String translateText(String text, String lang) {
		if (messageSource != null) {
			String t = messageSource.getMessage(text, null, new Locale(lang));
			return t;
		}
		return text;
	}

	public void clear() {
		if (util != null)
			util = null;
	}

	@GetMapping
	ResponseEntity<Void> redirectToLogin() {
		return ResponseEntity.status(HttpStatus.FOUND).location(URI.create("login")).build();
	}

	public static Date getTodayWithSettedTime(String timeString) {
		Calendar c = GregorianCalendar.getInstance();

		if (!timeString.equals("") && timeString.split(":").length > 1) {
			c.set(Calendar.HOUR_OF_DAY, Integer.parseInt(timeString.split(":")[0]));
			c.set(Calendar.MINUTE, Integer.parseInt(timeString.split(":")[1]));
			Date d = c.getTime();
			return d;
		}
		return null;
	}

	public static Date getInternalStartDate() {
		Calendar c = GregorianCalendar.getInstance();
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		Date d = c.getTime();
		return d;
	}

	public static Date getInternalEndDate() {
		Calendar c = GregorianCalendar.getInstance();
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		Date d = c.getTime();
		return d;
	}

	public static Date setDayStart(Date date) {
		Calendar c = GregorianCalendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		date = c.getTime();
		return date;
	}

	private Date getYesterday() {
		Calendar cal = GregorianCalendar.getInstance();
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}

	public static Date setDayEnd(Date date) {
		Calendar c = GregorianCalendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		date = c.getTime();

		return date;
	}

	/**
	 * String halde verilen tarih nesnesini date formatina ceviren metoddur.
	 * 
	 * @param stringValue string halindeki tarih parametresi
	 * @param format      cevirilmek istenen tarih formati
	 * @return date
	 */
	public static Date convertStringToDate(String stringValue, String format) {
		System.out.println("format:" + format);
		System.out.println("before:" + stringValue);
		try {
			Date date = new SimpleDateFormat(format).parse(stringValue);
			System.out.println("after:" + date);
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
			return new Date();
		}

	}

	public static String[] splitString(String splitStr, String delim) {
		StringTokenizer toker;
		String[] result;
		int count, i;

		toker = new StringTokenizer(splitStr, delim);
		count = toker.countTokens();
		result = new String[count];
		for (i = 0; i < count; ++i) {
			try {
				result[i] = toker.nextToken();
			} catch (NoSuchElementException ex) {
				result = null;
				break;
			}

		} // for()

		return result;
	} // splitString(

	public static String[] getSplitKeywords(String keyword) {
		String[] info = Utils.splitString(keyword, ",");
		if (info.length <= 2)
			return info;

		String txt = "";
		for (int i = 1; i < info.length; i++) {
			if (i > 1)
				txt += ",";
			txt += info[i];
		} // for()

		String[] res = new String[2];
		res[0] = info[0];
		res[1] = txt;
		return res;
	}

	public static String toFineCase(String txt) {
		boolean firstLetter = true;
		String s = "";
		for (int i = 0; i < txt.length(); i++) {
			int ch = txt.charAt(i);
			if (ch == ' ') {
				firstLetter = true;
				s += (char) ch;
				continue;
			}

			if (firstLetter) {
				firstLetter = false;
				switch (ch) {
				case 0x0C7:
					break;
				case 0x0E7:
					ch = 0x0C7;
					break; // ?

				case 0x0DE:
					ch = 0x15E;
					break; // ?
				case 0x0FE:
					ch = 0x15E;
					break; // ?
				case 0x0EE:
					ch = 0x15E;
					break; // ?
				case 0x15E:
					break; // ?
				case 0x15F:
					ch = 0x15E;
					break; // ?

				case 0x0D0:
					ch = 0x11E;
					break; // ?
				case 0x0F0:
					ch = 0x11E;
					break; // ?
				case 0x11E:
					break; // ?
				case 0x11F:
					ch = 0x11E;
					break; // ?

				case 0x0DD:
					ch = 0x130;
					break; // ?
				case 0x0FD:
					ch = 0x049;
					break; // I
				case 0x130:
					break; // ?
				case 0x131:
					ch = 0x049;
					break; // I
				case 0x069:
					ch = 0x130;
					break; // ?

				case 0x0D6:
					break;
				case 0x0F6:
					ch = 0x0D6;
					break; // ?

				case 0x0DC:
					break;
				case 0x0FC:
					ch = 0x0DC;
					break; // ?

				default:
					if (Character.isLowerCase(ch))
						ch = Character.toUpperCase(ch);
					break;
				} // switch()
			} else {
				switch (ch) {
				case 0x0C7:
					ch = 0x0E7;
					break; // ?
				case 0x0E7:
					break;

				case 0x0DE:
					ch = 0x15F;
					break; // ?
				case 0x0FE:
					ch = 0x15F;
					break; // ?
				case 0x0EE:
					ch = 0x15F;
					break; // ?
				case 0x15E:
					ch = 0x15F;
					break; // ?
				case 0x15F:
					break;

				case 0x0D0:
					ch = 0x11F;
					break; // ?
				case 0x0F0:
					ch = 0x11F;
					break; // ?
				case 0x11E:
					ch = 0x11F;
					break; // ?
				case 0x11F:
					break;

				case 0x0DD:
					ch = 0x069;
					break; // i
				case 0x0FD:
					ch = 0x131;
					break; // ?
				case 0x130:
					ch = 0x069;
					break; // i
				case 0x131:
					break;
				case 0x069:
					break;

				case 0x0D6:
					ch = 0x0F6;
					break; // ?
				case 0x0F6:
					break;

				case 0x0DC:
					ch = 0x0FC;
					break; // ?
				case 0x0FC:
					break;

				default:
					if (Character.isUpperCase(ch))
						ch = Character.toLowerCase(ch);
					break;
				} // switch()
			}
			s += (char) ch;
		} // for()
		return s;
	} // toFineCase()

	// -----------------------------------------------------------------------------
	public static String convToEnglish(String txt) {
		if (txt == null)
			return null;

		String s = "";

		for (int i = 0; i < txt.length(); i++) {
			char ch = txt.charAt(i);
			switch (ch) {
			case 0x11E:
				ch = 'G';
				break;
			case 0x11F:
				ch = 'g';
				break;
			case 0x15E:
				ch = 'S';
				break;
			case 0x15F:
				ch = 's';
				break;
			case 0x130:
				ch = 'I';
				break;
			case 0x131:
				ch = 'i';
				break;
			case 0x0C7:
				ch = 'C';
				break;
			case 0x0E7:
				ch = 'c';
				break;
			case 0x0DC:
				ch = 'U';
				break;
			case 0x0FC:
				ch = 'u';
				break;
			case 0x0D6:
				ch = 'O';
				break;
			case 0x0F6:
				ch = 'o';
				break;
			} // switch()
			s += ch;
		} // for()
		return (s);
	} // convToEnglish()

	// -----------------------------------------------------------------------------

	public static String toUpperCase(String txt) {
		String s = "";
		for (int i = 0; i < txt.length(); i++) {
			int ch = txt.charAt(i);
			switch (ch) {
			case 0x0C7:
				break;
			case 0x0E7:
				ch = 0x0C7;
				break; // ch

			case 0x0DE:
				ch = 0x15E;
				break; // ?
			case 0x0FE:
				ch = 0x15E;
				break; // ?
			case 0x0EE:
				ch = 0x15E;
				break; // ?
			case 0x15E:
				break; // ?
			case 0x15F:
				ch = 0x15E;
				break; // ?

			case 0x0D0:
				ch = 0x11E;
				break; // ?
			case 0x0F0:
				ch = 0x11E;
				break; // ?
			case 0x11E:
				break; // ?
			case 0x11F:
				ch = 0x11E;
				break; // ?

			case 0x0DD:
				ch = 0x130;
				break; // ?
			case 0x0FD:
				ch = 0x049;
				break; // I
			case 0x130:
				break; // ?
			case 0x131:
				ch = 0x049;
				break; // I
			case 0x069:
				ch = 0x130;
				break; // ?

			case 0x0D6:
				break;
			case 0x0F6:
				ch = 0x0D6;
				break; // ?

			case 0x0DC:
				break;
			case 0x0FC:
				ch = 0x0DC;
				break; // ?

			default:
				if (Character.isLowerCase(ch))
					ch = Character.toUpperCase(ch);
				break;
			} // switch()
			s += (char) ch;
		} // for()
		return s;
	} // toUpperCase()

	public static String convToReportEnglishSingle(String txt) {
		String s = "";
		for (int i = 0; i < txt.length(); i++) {
			int ch = txt.charAt(i);
			switch (ch) {
			case 0x0C7:
				s += "C";
				break;
			case 0x0E7:
				s += "c";
				break;
			case 0x0DE:
				s += "S";
				break;
			case 0x0FE:
				s += "s";
				break;
			case 0x0EE:
				s += "s";
				break;
			case 0x0DD:
				s += "I";
				break;
			case 0x0FD:
				s += "i";
				break;
			case 0x0D0:
				s += "G";
				break;
			case 0x0F0:
				s += "g";
				break;
			case 0x0DC:
				s += "U";
				break;
			case 0x0FC:
				s += "u";
				break;
			case 0x0D6:
				s += "O";
				break;
			case 0x0F6:
				s += "o";
				break;
			case 0x11E:
				s += "G";
				break;
			case 0x11F:
				s += "g";
				break;
			case 0x15E:
				s += "S";
				break;
			case 0x15F:
				s += "s";
				break;
			case 0x130:
				s += "I";
				break;
			case 0x131:
				s += "i";
				break;
			case 0x0C3:
				i++;
				ch = txt.charAt(i);
				switch (ch) {
				case 0x87:
					s += "C";
					break;
				case 0xA7:
					s += "c";
					break;
				case 0x9C:
					s += "U";
					break;
				case 0xBC:
					s += "u";
					break;
				case 0x96:
					s += "O";
					break;
				case 0xB6:
					s += "o";
					break;
				} // switch()
				break;
			case 0x0C4:
				i++;
				ch = txt.charAt(i);
				switch (ch) {
				case 0x9E:
					s += "G";
					break;
				case 0x9F:
					s += "g";
					break;
				case 0xB0:
					s += "I";
					break;
				case 0xB1:
					s += "i";
					break;
				} // switch()
				break;
			case 0x0C5:
				i++;
				ch = txt.charAt(i);
				switch (ch) {
				case 0x9E:
					s += "S";
					break;
				case 0x9F:
					s += "s";
					break;
				} // switch()
				break;
			default:
				s += (char) ch;
				break;
			} // switch()
		} // for()
			// System.out.println("str:" + s);
		return s;
	} // convToEnglish()


	public Long calculateDurationBetweenDates(Date date1, Date date2) {
		try {
			long diff = date2.getTime() - date1.getTime();
			return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
		} catch (Exception e) {
			return null;
		}
	}

	

	public DatePickerFormatDto adjustDatePickerFormatDto(DatePickerFormatDto data) {
		SimpleDateFormat formatter = new SimpleDateFormat(dateFormat, Locale.ENGLISH);

		Date dateSt = new Date();
		Date dateEnd = new Date();
		try {

			if (data.isUseYesterdayDate()) {
				Date yesterday = getYesterday();
				Date yesterday2 = getYesterday();
				dateSt = Utils.setDayStart(yesterday);
				dateEnd = Utils.setDayEnd(yesterday2);

				data.setStDate(dateSt);
				data.setEndDate(dateEnd);
				return data;
			}

			if (data.getStringEndDate() != null && data.getStringStDate() != null && !"".equals(data.getStringEndDate())
					&& !"".equals(data.getStringStDate())) {
				dateSt = Utils.convertStringToDate(data.getStringStDate(), dateFormat);
				dateEnd = Utils.convertStringToDate(data.getStringEndDate(), dateFormat);
				data.setStDate(dateSt);
				data.setEndDate(dateEnd);
			} else if (data.getDateRange() == null || data.getDateRange().equals("Bugün")) {

				String stringSDate = formatter.format(Utils.setDayStart(new Date()));
				String stringEDate = formatter.format(new Date());

				data.setStDate(Utils.convertStringToDate(stringSDate, dateFormat));
				data.setEndDate(Utils.convertStringToDate(stringEDate, dateFormat));

			} else if (data.getDateRange() == null || data.getDateRange().equals("Dün")) {

				Date yesterday = getYesterday();
				Date yesterday2 = getYesterday();

				String stringSDate = formatter.format(Utils.setDayStart(yesterday));
				String stringEDate = formatter.format(Utils.setDayEnd(yesterday2));

				data.setStDate(Utils.convertStringToDate(stringSDate, dateFormat));
				data.setEndDate(Utils.convertStringToDate(stringEDate, dateFormat));

			} else {

				if (data.getDateRange() != null && !data.getDateRange().equals("")) {
					String[] dateStringArr = data.getDateRange().split(" - ");
					dateSt = Utils.convertStringToDate(dateStringArr[0], dateFormat);
					dateEnd = Utils.convertStringToDate(dateStringArr[1], dateFormat);
					data.setStDate(dateSt);
					data.setEndDate(dateEnd);
				} else {
					String stringSDate = formatter.format(Utils.setDayStart(new Date()));
					String stringEDate = formatter.format(new Date());

					data.setStDate(Utils.convertStringToDate(stringSDate, dateFormat));
					data.setEndDate(Utils.convertStringToDate(stringEDate, dateFormat));
				}

			}
		} catch (Exception e) {
			System.out.println(e);
			logger.error("Servisten gelen tarih parametreleri ile ilgili bir problem oluştu");
		}

		return data;
	}

	public String getBirSifirValFromBoolenAsString(boolean bool) {
		if (bool) {
			return "1";
		} else {
			return "0";
		}
	}
	public Timestamp getSystemDateTime() {
		Calendar c = GregorianCalendar.getInstance();
		Timestamp timeStamp = new Timestamp(c.getTime().getTime());

		return timeStamp;
	}

	public Object runGetter(Object object, String fieldName) throws IllegalArgumentException, IllegalAccessException {
		Field field;
		try {
			field = object.getClass().getDeclaredField(fieldName);
			field.setAccessible(true);
			Object value = field.get(object);
			return value != null ? value : "";
		} catch (NoSuchFieldException | SecurityException e) {
			logger.warn(fieldName + " bulunamadı.");
			return "";
		}
	}

	public Long ikonTipiniYeniUygulamayaUyarla(Long iconType) {
		if (iconType == 1000 || iconType == 9000 || iconType == 12000 || iconType == 13000 || iconType == 14000
				|| iconType == 15000 || iconType == 19000) {
			return 0L;
		} else if (iconType == 4000 || iconType == 17000 || iconType == 18000) {
			return 2000L;
		} else if (iconType == 16000) {
			return 5000L;
		} else if (iconType == 11000) {
			return 7000L;
		}

		return iconType;
	}

	public String getVersion() {
		return version;
	}

	public String getRandomString() {
		return Long.toString(System.nanoTime());
	}

	public boolean validateMail(String email) {
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\." + "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
				+ "A-Z]{2,7}$";

		Pattern pat = Pattern.compile(emailRegex);
		if (email == null)
			return false;
		return pat.matcher(email).matches();
	}

	public MessageSource getMessageSource() {
		return messageSource;
	}

	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

	public void setMes(String path) {
		ReloadableResourceBundleMessageSource rs = context.getBean("messageSource",
				ReloadableResourceBundleMessageSource.class);
		rs.clearCache();
		rs.setBasename("classpath:" + path);
		rs.setDefaultEncoding("UTF-8");
	}

	public String getAndRemoveSessianAttr(String key) {
		String val = (String) sessionHttp.getAttribute(key);
		if (val != null)
			sessionHttp.removeAttribute(key);
		return val;
	}

	public void setSessionVal(String key, String val) {
		sessionHttp.setAttribute(key, val);
	}

	public Object getSessionVal(String key) {
		return sessionHttp.getAttribute(key);
	}

	public boolean isRememberMeActive() {
		Object rememberMeActive = sessionHttp.getAttribute("rememberMeActive");
		return rememberMeActive == null ? false : (boolean) rememberMeActive;
	}

	public void setRememberMeActive(boolean rememberMeActive) {
		sessionHttp.setAttribute("rememberMeActive", rememberMeActive);
	}

	public User getFastLoginUser() {
		Object attribute = sessionHttp.getAttribute("fastLoginUser");
		return attribute != null ? (User) attribute : null;
	}

	public void setFastLoginUser(User fastLoginUser) {
		sessionHttp.setAttribute("fastLoginUser", fastLoginUser);
	}

	public String getFastLoginErrorMsg() {
		Object attribute = sessionHttp.getAttribute("fastLoginErrorMsg");
		return attribute != null ? (String) attribute : "";
	}

	public void setFastLoginErrorMsg(String fastLoginErrorMsg) {
		sessionHttp.setAttribute("fastLoginErrorMsg", fastLoginErrorMsg);
	}

	
}
