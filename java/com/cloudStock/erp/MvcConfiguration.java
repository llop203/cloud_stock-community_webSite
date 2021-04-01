package com.cloudStock.erp;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new SessionInterceptor()).excludePathPatterns(
				"/loginForm.do"
				, "/loginProc.do"
				, "/searchIDForm.do"
				, "/searchPWDForm.do"
				, "/searchPWDProc.do"
				, "/changePWDForm.do"
				, "/changePWDProc.do"
				, "/checkIDForm.do"
				, "/checkIDProc.do"
				, "/logoutForm.do"
				, "/joinForm.do"
				, "/joinProc.do"
				, "/idCheckProc.do"
				, "/mainPageForm.do"
				, "/tipBoardForm.do"
				, "/tipBoardContentForm.do"
				,"/resources/**"
		);
	}
}