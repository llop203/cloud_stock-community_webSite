package com.cloudStock.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeBoardService;
	
	
	
	@RequestMapping(value="/freeBoardForm.do")
	public ModelAndView freeBoardForm(
			FreeBoardSearchDTO freeBoardSearchDTO
			, FreeBoardDTO freeBoardDTO
			, @RequestParam(value="free_b_no",		required=false,		defaultValue="0") int free_b_no
			
	
	) {

		
		int boardListAllCnt = this.freeBoardService.getBoardListAllCnt(freeBoardSearchDTO);

		
		if(boardListAllCnt>0) {
			int beginRowNo = (freeBoardSearchDTO.getSelectPageNo()-1)*freeBoardSearchDTO.getRowCntPerPage()+1;
			
			
			if(boardListAllCnt<beginRowNo) {
				freeBoardSearchDTO.setSelectPageNo(1);
			}
		}
		
		System.out.println(freeBoardSearchDTO.getOrderby());
		
		List<Map<String,String>> boardList = this.freeBoardService.getBoardList(freeBoardSearchDTO);
		// System.out.println(boardList.get(0).get("free_heart"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeBoardForm.jsp");
		mav.addObject("boardListAllCnt",boardListAllCnt);
		mav.addObject("boardList",boardList);
		return mav;
	}

	@ResponseBody
	public ModelAndView goFreeBoardForm(
			FreeBoardDTO freeBoardDTO
			, @RequestParam(value="free_b_no",		required=false,		defaultValue="0") int free_b_no
	) {
		int replyListAllCnt = this.freeBoardService.getReplyListAllCnt(freeBoardDTO);

		
		ModelAndView mav = new ModelAndView();
		mav.addObject("replyListAllCnt",replyListAllCnt);
		mav.addObject("free_b_no",free_b_no);
		return mav;
		}
	
	

	//---------------------------------------------------------------------------------------------
	@RequestMapping(value="/freeBoardContentForm.do")
	@ResponseBody
	public ModelAndView goFreeBoardContentForm(
			//@RequestParam(value="free_b_no") int free_b_no
			@RequestParam(value="free_b_no",		required=false,		defaultValue="0") int free_b_no
			, FreeBoardDTO freeBoardDTO
			, HttpSession session
	) {


		//freeBoardDTO.setUser_id(freeBoardDTO.getUser_id());
		
		String login_user_id = (String) session.getAttribute("user_id");
		System.out.println(login_user_id);
		
		freeBoardDTO.setUser_no(session.getAttribute("user_no"));
		int heart_count = this.freeBoardService.getHeartCnt(freeBoardDTO);
		
		int replyListAllCnt = this.freeBoardService.getReplyListAllCnt(freeBoardDTO);

		List<Map<String,String>> replyList = this.freeBoardService.getReplyList(freeBoardDTO);
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeBoardContentForm.jsp");

		FreeBoardDTO board = this.freeBoardService.getBoard(free_b_no);
		mav.addObject("board",board);	
		mav.addObject("free_b_no",free_b_no);

		//==========================================================
		board.setFree_heart_no(freeBoardDTO.getFree_heart_no());
		//==========================================================
		board.setHeart_count(heart_count);

		mav.addObject("replyList",replyList);

		mav.addObject("replyListAllCnt",replyListAllCnt);
		mav.addObject("login_user_id", login_user_id);

		return mav;
	}
	
	

	@RequestMapping(
			value="/freeBoardContentProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	
	@ResponseBody
	public int insertReply(
			FreeBoardDTO freeBoardDTO, HttpSession session
	){		

		
		freeBoardDTO.setUser_no(session.getAttribute("user_no"));
		System.out.println(session.getAttribute("user_no"));
		
		//freeBoardDTO.setUser_no(1);
		
		
		int boardReplyCnt =  0;
		
		System.out.println("FreeBoardController insertReply 진입성공");
		boardReplyCnt = this.freeBoardService.insertReply(freeBoardDTO);
		System.out.println("FreeBoardController insertReply DB 연동 성공");	
		return boardReplyCnt;
	}
	//---------------------------------------------------------------------------------------------
	
	
	
	@RequestMapping(value="/freeBoardRegForm.do")
	public ModelAndView freeBoardRegForm(
			
			@RequestParam(value="free_b_no",		required=false,		defaultValue="0") int free_b_no	
			
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeBoardRegForm.jsp");
		mav.addObject("free_b_no",free_b_no);
		return mav;
	}
	
	@RequestMapping(
			value="/freeBoardRegProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int insertBoard(
			FreeBoardDTO freeBoardDTO, HttpSession session
	){
		freeBoardDTO.setUser_no(session.getAttribute("user_no"));
		int boardRegCnt =  0;
		boardRegCnt = this.freeBoardService.insertBoard(freeBoardDTO);	
		return boardRegCnt;
	}
	
	
	
	@RequestMapping(value="/freeBoardUpDelForm.do", method=RequestMethod.POST)
	public ModelAndView goFreeBoardUpDelForm(
			
		@RequestParam(value="free_b_no") int free_b_no
			
	){ 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeBoardUpDelForm.jsp");
		FreeBoardDTO board = this.freeBoardService.getBoard_without_updateReadcount(free_b_no);	
		mav.addObject("board", board);	
		return mav;
	}

	@RequestMapping(
			value="/freeBoardUpDelProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String,String> freeBoardUpDelProc(
			FreeBoardDTO freeBoardDTO
			,@RequestParam(value="upDel") String upDel
	){ 
		int boardUpDelCnt = 0;

		
		if(upDel.equals("del")) {
			
			boardUpDelCnt = this.freeBoardService.deleteBoard(freeBoardDTO);

		}
		
		else {
			
			boardUpDelCnt = this.freeBoardService.updateBoard(freeBoardDTO);	
		
		}
				
		Map<String,String> map = new HashMap<String,String>();
		map.put("boardUpDelCnt",boardUpDelCnt+"");
		
		return map;		
	}
	
	//===============================================================================
	
	@RequestMapping(
			value="/freeHeartProc.do"
			, method=RequestMethod.POST
			, produces="application/json;charset=UTF-8"
    )
	@ResponseBody
	public int free_heart_btn_update(
			       FreeBoardDTO freeBoardDTO, HttpSession session
	){
		freeBoardDTO.setUser_no(session.getAttribute("user_no"));
		int free_heart_btn_update = 0;
	    free_heart_btn_update = this.freeBoardService.free_heart_btn_update(freeBoardDTO);
		//System.out.println(freeBoardDTO.getUser_no());
		return free_heart_btn_update;
	}
	
	//-------------------------------------------------------------
	
	@RequestMapping("/freeHeartCnt.do")
	public ModelAndView dashboard(
			FreeBoardDTO freeBoardDTO
			, HttpSession session
	){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeBoardContentForm.jsp");
		
		int free_b_no = (int) session.getAttribute("free_b_no");
		freeBoardDTO.setFree_b_no(free_b_no);
		

		List<Map<String,String>> free_heartList = null;
		free_heartList = this.freeBoardService.get_free_heartList(freeBoardDTO);
		
		mav.addObject("free_heart",free_heartList.get(0).get("free_heart"));  

		return mav;
		
		// 세션에 free_b_no 를 얻기

		// free_b_no 를 가지고 DB 연동해서 free_heart 를 얻기
		
		// free_heart 를 mav 객체에 담기

	}
	

	//===============================================================================
	
	
	
}






