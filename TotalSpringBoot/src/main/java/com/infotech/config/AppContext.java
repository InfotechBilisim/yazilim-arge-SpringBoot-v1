package com.infotech.config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jndi.JndiTemplate;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;



@Configuration
@PropertySource("classpath:database.properties")
@PropertySource("classpath:app.properties")
//@PropertySource(value = "file:${infotechConfigPath}", ignoreResourceNotFound = true)
@EnableTransactionManagement
@ComponentScan(basePackages = { "com.infotech" })
public class AppContext {

	private static final Logger logger = LogManager.getLogger(AppContext.class);

	@Autowired
	private Environment environment;

	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		logger.info("LocalSessionFactoryBean loading");
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setPackagesToScan(new String[] { "com.infotech.entity" });
		sessionFactory.setHibernateProperties(hibernateProperties());
		return sessionFactory;
	}

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		try {
			//JNDİ TOMCAT içinde kullanılacaksa WebContent/META-INF/context.xml altından aktive edilebilir.
			System.out.println("--[JNDI okunuyor]--");
			
			return (DataSource) new JndiTemplate().lookup(environment.getRequiredProperty("jndiPath"));
		} catch (NamingException e) {
			dataSource.setDriverClassName(environment.getRequiredProperty("jdbc.driver"));
			dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
			dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
			dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));
			System.out.println("----------------[JNDI NOT FOUND ERROR] - [Bu hata geliyorsa endiselenecek bir sey  yok. jdbc ayarları normal database.properties dosyasindan yuklenip sistemin calismasi saglanmaya devam edilmis olacak. ]----------------------");
			logger.error("NamingException for " + environment.getRequiredProperty("jndiPath"), e);
		} finally {

		}
		return dataSource;
	}

	private Properties hibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", environment.getRequiredProperty("hibernate.dialect"));
		properties.put("hibernate.show_sql", environment.getRequiredProperty("hibernate.show_sql"));
		properties.put("hibernate.format_sql", environment.getRequiredProperty("hibernate.format_sql"));
		properties.put("hibernate.use_sql_comments", environment.getRequiredProperty("hibernate.use_sql_comments"));
		properties.put("hibernate.hbm2ddl.auto", environment.getRequiredProperty("hibernate.hbm2ddl.auto"));
		properties.put("hibernate.generate_statistics",
				environment.getRequiredProperty("hibernate.generate_statistics"));

		// Hibernate C3p0 properties

		properties.put("hibernate.c3p0.min_size", environment.getRequiredProperty("hibernate.c3p0.min_size"));
		properties.put("hibernate.c3p0.max_size", environment.getRequiredProperty("hibernate.c3p0.max_size"));
		properties.put("hibernate.c3p0.acquire_increment",
				environment.getRequiredProperty("hibernate.c3p0.acquire_increment"));
		properties.put("hibernate.c3p0.idle_test_period",
				environment.getRequiredProperty("hibernate.c3p0.idle_test_period"));
		properties.put("hibernate.c3p0.max_statements",
				environment.getRequiredProperty("hibernate.c3p0.max_statements"));
		properties.put("hibernate.c3p0.timeout", environment.getRequiredProperty("hibernate.c3p0.timeout"));

		return properties;
	}

	/*@Bean
	public HibernateTransactionManager getTransactionManager() {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
		transactionManager.setSessionFactory(sessionFactory().getObject());
		return transactionManager;
	}*/


}