package com.cloudStock.erp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	
	@Autowired 
	private MyPageService myPageService;
	
	
	@RequestMapping("/myPageForm.do")
	public ModelAndView myPageForm(
			MyPageDTO myPageDTO
			, HttpSession session
	) {
		
		myPageDTO.setUser_no(session.getAttribute("user_no"));
		MyPageDTO myPage = this.myPageService.getMyPage(myPageDTO);
	//	System.out.print("마이페이지");
	//	System.out.println(myPageDTO.getUser_no());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPageForm.jsp");
		mav.addObject("myPage", myPage);
		
		return mav;
	}
	
	@RequestMapping("/myPageUpDelForm.do")
	public ModelAndView myPageUpDelForm(
			MyPageDTO myPageDTO
			, HttpSession session
	) {
		
		myPageDTO.setUser_no(session.getAttribute("user_no"));
		
		MyPageDTO myPage = this.myPageService.getMyPage(myPageDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPageUpDelForm.jsp");
		
		mav.addObject("myPage", myPage);
		return mav;
	}
	
	@RequestMapping( 
			value = "/myPageUpdateProc.do" 
			,method= RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int updateMyPage(
		MyPageDTO myPageDTO
		, HttpSession session
	){
		
		myPageDTO.setUser_no(session.getAttribute("user_no"));
		//myPageDTO.setUser_no(5);
		
	//	String userBirth = myPageDTO.getUser_year()+"-"+myPageDTO.getUser_month()+"-"+myPageDTO.getUser_day();
	//	myPageDTO.setUser_birth(userBirth);
		/*
		 * System.out.print("업데이트프록\n"); System.out.println(myPageDTO.getUser_no());
		 * System.out.println(myPageDTO.getUser_name());
		 * System.out.println(myPageDTO.getUser_birth());
		 * System.out.println(myPageDTO.getUser_phone());
		 * System.out.println(myPageDTO.getUser_email());
		 */
		
		int myPageUpCnt = 0;
		
		myPageUpCnt = this.myPageService.updateMyPage(myPageDTO);
		
		return myPageUpCnt;
	}
	
	@RequestMapping( 
			value = "/myPageDeleteProc.do" 
			,method= RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int dleteMyPage(
		MyPageDTO myPageDTO
		, HttpSession session
	){
		
		myPageDTO.setUser_no(session.getAttribute("user_no"));
		//myPageDTO.setUser_no(5);
		
		
		int myPageDelCnt = 0;
		
		myPageDelCnt = this.myPageService.deleteMyPage(myPageDTO);
		
		if(myPageDelCnt==1) {
			session.removeAttribute("user_no");
			session.removeAttribute("user_id");
			
		}
		
		return myPageDelCnt;
	}

}
