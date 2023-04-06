package com.scii.demo.config;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
public class MessageSourceConfig {
	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasenames("/WEB-INF/i18n/labels/label", 
								  "/WEB-INF/i18n/buttons/button", 
								  "/WEB-INF/i18n/messages/msg");
		//"classpath:/WEB-INF/i18n/messages/msg", "classpath:/WEB-INF/i18n/labels/label");
		messageSource.setDefaultEncoding("UTF-8");
		System.out.println("messageSource: "+messageSource.getBasenameSet());
		return messageSource;
	}
	
//	@Bean
//	 public LocalValidatorFactoryBean validator(MessageSource messageSource) {
//	    LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
//	    bean.setValidationMessageSource(messageSource);
//	    return bean;
//	 }
	
	@Bean
	 public SessionLocaleResolver localeResolver() {
	    SessionLocaleResolver localeResolver = new SessionLocaleResolver();
	    localeResolver.setDefaultLocale(Locale.ENGLISH);
	    return localeResolver;
	 }

	 @Bean
	 public LocaleChangeInterceptor localeChangeInterceptor() {
	    LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
	    localeChangeInterceptor.setParamName("lang");
	    return localeChangeInterceptor;
	 }

//	 @Override
//	 public void addInterceptors(InterceptorRegistry registry) {
//	   registry.addInterceptor(localeChangeInterceptor());
//	 }
}
