package com.cloudStock.erp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnalysisController {
	
	@Autowired
	private AnalysisService analysisService;
	
	@RequestMapping("/analysisForm.do")
	public ModelAndView serviceForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("analysisForm.jsp");
		return mav;
	}
	
	
	// q1
	@RequestMapping("/q1.do")
	public ModelAndView q1Form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q1.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q1Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q1Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ1Update = this.analysisService.q1Update(analysisDTO);

		return getQ1Update;
	}
	
	
	// q2
	@RequestMapping("/q2.do")
	public ModelAndView q2Form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q2.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q2Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q2Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ2Update = this.analysisService.q2Update(analysisDTO);
		
		return getQ2Update;
	}
	
	
	// q3
	@RequestMapping("/q3.do")
	public ModelAndView q3Form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q3.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q3Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q3Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ3Update = this.analysisService.q3Update(analysisDTO);
		return getQ3Update;
	}
	
	
	// q4
	@RequestMapping("/q4.do")
	public ModelAndView q4Form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q4.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q4Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q4Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ4Update = this.analysisService.q4Update(analysisDTO);
		return getQ4Update;
	}
	
	
	// q5
	@RequestMapping("/q5.do")
	public ModelAndView q5() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q5.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q5Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q5Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ5Update = this.analysisService.q5Update(analysisDTO);
		
		return getQ5Update;
	}
	
	
	// q6
	@RequestMapping("/q6.do")
	public ModelAndView q6Form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q6.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q6Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q6Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ6Update = this.analysisService.q6Update(analysisDTO);
		
		return getQ6Update;
	}
	
	
	// q7
	@RequestMapping("/q7.do")
	public ModelAndView q7Form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q7.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q7Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q7Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ7Update = this.analysisService.q7Update(analysisDTO);
		
		return getQ7Update;
	}
	
	
	// q8
	@RequestMapping("/q8.do")
	public ModelAndView q8Form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q8.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q8Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q8Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ8Update = this.analysisService.q8Update(analysisDTO);
		
		return getQ8Update;
	}
	
	
	// q9
	@RequestMapping("/q9.do")
	public ModelAndView q9Form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q9.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q9Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q9Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ9Update = this.analysisService.q9Update(analysisDTO);
		
		return getQ9Update;
	}
	
	
	// q10
	@RequestMapping("/q10.do")
	public ModelAndView q10Form() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("q10.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/q10Proc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int q10Update(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		int getQ10Update = this.analysisService.q10Update(analysisDTO);
		
		return getQ10Update;
	}
	
	
	// resultListForm
	@RequestMapping("resultListForm.do")
	public ModelAndView resultListForm(AnalysisDTO analysisDTO, HttpSession session) {
		analysisDTO.setUser_no(session.getAttribute("user_no"));
		
		ModelAndView mav = new ModelAndView();
		
		AnalysisDTO getResultList = this.analysisService.resultList(analysisDTO);

		mav.setViewName("resultListForm.jsp");
		mav.addObject("getResultList", getResultList);

		return mav;
	}
	
	
	
}







