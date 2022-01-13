package com.infotech.map;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;

public class App {
	  Locale preferredLocale;
	  @Value("${INFOMOBIL.DEFAULT_LANGUAGE}")
	    private String defaultLanguage;
	  
	  @Autowired
	  private static ApplicationContext context;

	  public static App getSessionInstance() {
	    App app = (App) context.getBean("App");
	    return app;
	  }

	  public App() {
	    this.preferredLocale = new Locale(defaultLanguage);
	  }

	  public static String getPreferredLocaleAsString() {
	    App app = App.getSessionInstance();
	    String language = null;
	    if (app.preferredLocale != null) {
	      language = app.preferredLocale.getLanguage();
	    }
	    return language;
	  }

	  public static void setPreferredLocaleAsString(String localeString) {
	    App app = App.getSessionInstance();
	    app.preferredLocale = new Locale(localeString);
	  }

	    public static Locale getPreferredLocale() {
	      App app = App.getSessionInstance();
	      return app.preferredLocale;
	    }

	  public static void setPreferredLocale(Locale locale) {
	    App app = App.getSessionInstance();
	    app.preferredLocale = locale;
	  }
	}
