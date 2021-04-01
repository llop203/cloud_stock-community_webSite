package com.cloudStock.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/loginForm.do")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginForm.jsp");
		return mav;
	}
	
	@RequestMapping(
		value = "/loginProc.do"
		, method = RequestMethod.POST
		, produces = "application/json; charset=UTF-8"
	)
	@ResponseBody
	public int loginCnt(@RequestParam(value="user_id") String user_id,
						@RequestParam(value="user_pwd") String user_pwd,
						@RequestParam(value="is_login", required=false) 
						String is_login, HttpSession session,
						HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pwd", user_pwd);
		
		System.out.println("컨트롤러 들아옴");
		
		int user_idCnt = 0;
		
		user_idCnt = this.loginService.loginCnt(map);

		
		
		if(user_idCnt == 1 || user_idCnt == -1) {
			session.setAttribute("user_id", user_id);
			
			System.out.println(session.getAttribute("user_id"));
			LoginDTO user_no = this.loginService.getUserNumber(map);

			
			session.setAttribute("user_no", user_no.getUser_no());

				
			if(is_login == null) {
				
				Cookie cookie1 = new Cookie("user_id", null);
				
				// Cookie 객체 수명은 0으로 하기
				cookie1.setMaxAge(0);	
					
				// Cookie 객체를 응답메시지에 저장하기
				response.addCookie(cookie1);
				
			}
			
			// 매개변수 is_login에  "y"가 저장되어 있으면 아이디, 암호 자동입력 의사가 있을 경우
			else {
			
				// 쿠키를 생성하고 쿠키명-쿠키값을 ["admin_id" -"입력아이디"]로 하고 수명은 60*60*24로 생성
				Cookie cookie1 = new Cookie("user_id", user_id);
				cookie1.setMaxAge(60*60*24);
				
				
				// Cookie 객체를 응답메시지에 저장하기.
				response.addCookie(cookie1);
				
			}
	}
	
	return user_idCnt;
}
	
	@RequestMapping("/searchIDForm.do")
	public ModelAndView searchIDForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchIDForm.jsp");
		return mav;
	}
	
	@RequestMapping("/searchPWDForm.do")
	public ModelAndView searchPWDForm(LoginDTO loginDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchPWDForm.jsp");
		
		return mav;
	}
	
	
	@RequestMapping(
			value="/searchPWDProc.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String,String> getChangePWD(
			LoginDTO loginDTO		
	) {
		System.out.println(loginDTO.getUser_birth());
		int changePWD = this.loginService.getchangePWD(loginDTO);
		
		LoginDTO UserNo = this.loginService.getUserNo(loginDTO);
		System.out.println(UserNo.getUser_no());
		Map<String,String> map = new HashMap<String,String>();
		map.put("changePWD", changePWD+"");
		map.put("user_no", UserNo.getUser_no()+"");
		return map;
	}
	
	@RequestMapping(
			value="/changePWDForm.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public ModelAndView changePWDForm(
			LoginDTO loginDTO
		) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("changePWDForm.jsp");
		
		System.out.println(loginDTO.getUser_no());
		
		mav.addObject("user_no", loginDTO.getUser_no());
		
		return mav;
	}
	
	@RequestMapping(
			value="/changePWDProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int changePWDCnt(LoginDTO loginDTO) {
		int chagePwdCnt = this.loginService.getChangePwdCnt(loginDTO);
		return chagePwdCnt;
				
	}
	
	
	@RequestMapping(
			value="/checkIDForm.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public ModelAndView checkIDForm(LoginDTO loginDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("checkIDForm.jsp");		
	//	String user_birth = loginDTO.getUser_birth();	
		LoginDTO SearchID = this.loginService.getsearchID(loginDTO);
		mav.addObject("SearchID", SearchID);
		return mav;
	}
	
	
	@RequestMapping(
			value="/checkIDProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int checkID(LoginDTO loginDTO) {
		
		int getcheckID = this.loginService.checkID(loginDTO);
		return getcheckID;
				
	}
//----------------------------------------------------------------
	@RequestMapping(value="/logoutForm.do")
	public ModelAndView logout(
		HttpSession session
	){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("logoutForm.jsp");

		return mav;
	}
	
	
	
	
}
