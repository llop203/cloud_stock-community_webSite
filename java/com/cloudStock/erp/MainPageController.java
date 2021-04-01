package com.cloudStock.erp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainPageController {
	
	@RequestMapping("/mainPageForm.do")
	public ModelAndView mainPageForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainPageForm.jsp");
		return mav;
	}
	
	
}
