package com.infotech;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication
public class TotalSpringBoot extends SpringBootServletInitializer {
	public static void main(String[] args) throws Exception {
		SpringApplication.run(TotalSpringBoot.class, args);
	}
	 @Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
	        return builder.sources(TotalSpringBoot.class);
	    }
}