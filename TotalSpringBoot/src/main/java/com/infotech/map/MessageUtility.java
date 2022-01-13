package com.infotech.map;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import java.util.ResourceBundle;

import org.springframework.beans.factory.annotation.Autowired;

import com.infotech.config.Utils;
import com.infotech.profile.UserInfo;

public class MessageUtility {
	  public static Hashtable<String, Properties> msgProperties = null;
	  private static final String UIResourcesFileName = "UIResources";
	  private static final String HelpResourcesFileName = "HelpResources";
	  private static final String DBResourcesFileName = "DBResources";

	 private static Utils utils = new Utils().get();
	  public MessageUtility() {
	  }

	  private static String findMessageFromBundle(String bundleKey, String bundleName, String key) {
	    if (MessageUtility.msgProperties == null) {
	      MessageUtility.msgProperties = new Hashtable<String, Properties>();
	      msgProperties.put(bundleKey, MessageUtility.loadParams(bundleName));
	    } else {
	      if (!MessageUtility.msgProperties.containsKey(bundleName)) {
	        msgProperties.put(bundleKey, MessageUtility.loadParams(bundleName));
	      }
	    }
	    // If value can not be found then just return the key.
	    if (MessageUtility.msgProperties == null)
	      return key;
	    if (MessageUtility.msgProperties.get(bundleKey) == null)
	      return key;
	    if (MessageUtility.msgProperties.get(bundleKey).get(key) == null)
	      return key;
	    return MessageUtility.msgProperties.get(bundleKey).get(key).toString();
	  }

	  private static String getNormalizedBundleName(String bundleName) {
	    String normalizedBundleName = bundleName;
	    UserInfo userInfo = (UserInfo) utils.getUserInfo();
	    return normalizedBundleName;
	  }

	  public static String getMessageFromBundle(String bundleName, String key) {
	    // We need to normalize bundleName
	    String normalizedBundleName = MessageUtility.getNormalizedBundleName(bundleName);
	    String bundleKey = bundleName + "_" + App.getPreferredLocaleAsString();
	    return MessageUtility.findMessageFromBundle(bundleKey, normalizedBundleName, key);
	  }

	  public static String getMessage(String key) {
	    String bundleName = MessageUtility.UIResourcesFileName;
	    return MessageUtility.getMessageFromBundle(bundleName, key);
	  }

	  private static Properties loadParams(String file) {
	    Properties prop = new Properties();
	    try {
	      // Loads a ResourceBundle and creates Properties from it
	      ResourceBundle bundle = ResourceBundle.getBundle(file, App.getPreferredLocale());
	      // Retrieve the keys and populate the properties object
	      Enumeration enum1 = bundle.getKeys();
	      String key = null;
	      while (enum1.hasMoreElements()) {
	        key = (String)enum1.nextElement();
	        prop.put(key, bundle.getObject(key));
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	      prop = null;
	    }
	    return prop;
	  }
	}
