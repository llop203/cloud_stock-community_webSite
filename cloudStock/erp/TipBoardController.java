package com.cloudStock.erp;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class TipBoardController {
	
	@Autowired 
	private TipBoardService tipBoardService;
	
	
	
	@RequestMapping("/tipBoardForm.do")
	public ModelAndView tipBoardForm(
			TipBoardSearchDTO tipBoardSearchDTO
			, TipBoardDTO tipBoardDTO
			, HttpSession session
		) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipBoardForm.jsp");
		
		System.out.println(session.getAttribute("user_no"));
		
		int tipBoardListAllCnt = this.tipBoardService.getTipBoardListAllCnt(tipBoardSearchDTO);
		
		if(tipBoardListAllCnt>0) {
			int beginRowNo = tipBoardSearchDTO.getSelectPageNo()*tipBoardSearchDTO.getRowCntPerPage()
								- tipBoardSearchDTO.getRowCntPerPage()+1;
			
			if(tipBoardListAllCnt<beginRowNo) {
				tipBoardSearchDTO.setSelectPageNo(1);
			}
		}
		
		
		
		List<Map<String,String>> tipBoardList = this.tipBoardService.getTipBoardList(tipBoardSearchDTO);
		
		mav.addObject("tipBoardList", tipBoardList);
		mav.addObject("tipBoardListAllCnt", tipBoardListAllCnt);
		
		//mav.addObject("admin_no", Integer.parseInt(String.valueOf(session.getAttribute("emp_no"))));
		
		return mav;
	}
	
	@RequestMapping("/tipBoardContentForm.do")
	public ModelAndView tipBoardContentForm(
			@RequestParam(value="tip_b_no") int tip_b_no
			, TipBoardDTO tipBoardDTO
			
		) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipBoardContentForm.jsp");
		
		TipBoardDTO tipBoard = this.tipBoardService.getTipBoard(tip_b_no);
		
		mav.addObject("tipBoard", tipBoard);
		
		return mav;
	}
	
	@RequestMapping("/tipBoardRegForm.do")
	public ModelAndView tipBoardRegForm(
			TipBoardDTO tipBoardDTO
			, HttpSession session
		) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipBoardRegForm.jsp");
		
	
		
		System.out.println("===-=-=-=-=-=-=-");
		System.out.println(tipBoardDTO.getAdmin_no());

		TipBoardDTO admin_pwd = this.tipBoardService.getAdmin_pwd(tipBoardDTO);
		mav.addObject("admin_pwd", admin_pwd);
		
		return mav;
	}
	
	@RequestMapping( 
			value = "/tipBoardRegProc.do" 
			,method= RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int insertTipBoard(
		TipBoardDTO tipBoardDTO
		, @RequestParam(value="tip_pic2") MultipartFile multi
	){
		
		
		int tipBoardRegCnt = 0;
		
		String title = tipBoardDTO.getTip_title();
		System.out.println(title);
		
		String content = tipBoardDTO.getTip_content();
		System.out.println(content);
		
		try {
			
			tipBoardRegCnt = this.tipBoardService.insertTipBoard(tipBoardDTO, multi);
		}
		catch(Exception ex) {
			tipBoardRegCnt = -1;
			System.out.println(ex.getMessage());
		}
		return tipBoardRegCnt;
	}
	
	



	
	@RequestMapping(
			value = "/tipBoardUpDelForm.do"
			,method= RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public ModelAndView tipBoardUpDelForm(
			@RequestParam(value="tip_b_no") int tip_b_no
			, TipBoardDTO tipBoardDTO
			, HttpSession session
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipBoardUpDelForm.jsp");
		
		TipBoardDTO tipBoard = this.tipBoardService.getTipBoardDTO_without_upReadCount(tip_b_no);
		mav.addObject("tipBoard", tipBoard);
		
		// 세션에 저장된 admin_no TipBoardDTO 저장하고 admin_pwd TipBoardDTO 저장
		// tipBoardDTO.setAdmin_no(Integer.parseInt(String.valueOf(session.getAttribute("emp_no"))));
		TipBoardDTO admin_pwd = this.tipBoardService.getAdmin_pwd(tipBoardDTO);
		mav.addObject("admin_pwd", admin_pwd);
		
		return mav;
	}
	
	@RequestMapping(
			value = "/tipBoardUpdateProc.do"
			,method= RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int tipBoardUpdateCnt(
			TipBoardDTO tipBoardDTO
			, @RequestParam(value="tip_pic2") MultipartFile multi
	) {
		int updateCnt = 0;
		
		try {
			updateCnt = this.tipBoardService.updateTipBoard(tipBoardDTO, multi);
		}
		catch(Exception ex) {
			updateCnt = -1;
			System.out.println(ex.getMessage());
		}
		
		return updateCnt;
	}




	@RequestMapping(
			value = "/tipBoardDeleteProc.do"
			,method= RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int tipBoardDeleteCnt(
			TipBoardDTO tipBoardDTO
	) {
		int deleteCnt = 0;
		
		deleteCnt = this.tipBoardService.deleteTipBoard(tipBoardDTO);
		
		
		return deleteCnt;
	}
	
	
}
