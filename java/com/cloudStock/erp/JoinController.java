package com.cloudStock.erp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
	@RequestMapping("/joinForm.do")
	public ModelAndView joinForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinForm.jsp");
		return mav;
	}	
	
	@RequestMapping(
	value = "/joinProc.do"
	, method = RequestMethod.POST
	, produces = "application/json; charset=UTF-8")
	
	@ResponseBody
	public int getjoinCnt(JoinDTO joinDTO) {
		
		System.out.println(joinDTO.getUser_year() + "-" + joinDTO.getUser_month() + "-" + joinDTO.getUser_day());
		
		joinDTO.setUser_birth(joinDTO.getUser_year() + "-" + joinDTO.getUser_month() + "-" + joinDTO.getUser_day());
		
		int getidCheckCnt = this.joinService.idCheckCnt(joinDTO);
		if(getidCheckCnt>=1) {
			return -1;
		}
		
		int joinCnt = this.joinService.getjoinCnt(joinDTO);
		
		return joinCnt;
	}
	
	@RequestMapping(
			value = "/idCheckProc.do"
			, method = RequestMethod.POST
			, produces = "application/json; charset=UTF-8"
		)
	@ResponseBody
	public int idCheckCnt(JoinDTO joinDTO) {
		int getidCheckCnt = this.joinService.idCheckCnt(joinDTO);
		return getidCheckCnt;
	}

}
