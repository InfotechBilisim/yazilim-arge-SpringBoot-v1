package com.infotech.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer implements WebApplicationInitializer {
	
	   @Override
	    public void onStartup(ServletContext servletContext) throws ServletException {
	        AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
	        appContext.register(AppContext.class);
	 
	        // Dispatcher Servlet
	        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("SpringDispatcher",
	                new DispatcherServlet(appContext));
	        dispatcher.setLoadOnStartup(1);
	        dispatcher.addMapping("/");
	        dispatcher.setInitParameter("throwExceptionIfNoHandlerFound", "true");
	         
	        dispatcher.setInitParameter("contextClass", appContext.getClass().getName());
	 
	        servletContext.addListener(new ContextLoaderListener(appContext));
	         
	        // UTF8 Charactor Filter.
	        FilterRegistration.Dynamic fr = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
	 
	        fr.setInitParameter("encoding", "UTF-8");
	        fr.setInitParameter("forceEncoding", "true");
	        fr.addMappingForUrlPatterns(null, true, "/*");        
	    }
	
    @Override
    protected Class<?> [] getRootConfigClasses() {
        return new Class[] {
            AppContext.class
        };
        //return null;
    }

    @Override
    protected Class<?> [] getServletConfigClasses() {
        return new Class[] {
            WebMvcConfig.class
        };
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] {
            "/"
        };
    }
    
    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        boolean done = registration.setInitParameter("throwExceptionIfNoHandlerFound", "true"); // -> true
        if(!done) throw new RuntimeException();
    }
}