package com.cloudStock.erp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;


public class SessionInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(
			HttpServletRequest request
			,HttpServletResponse response
			,Object handler
	) throws Exception {
		HttpSession session = request.getSession();
		
		String user_id = (String) session.getAttribute("user_id");
		//int user_no = (int)session.getAttribute("user_no");
		
		if(user_id==null) {
			String croot = request.getContextPath();
			
			response.sendRedirect(croot +"/logoutForm.do");
			
			return false;
		}
		else {
			return true;
		}
	}
}
