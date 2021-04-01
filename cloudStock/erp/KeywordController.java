package com.cloudStock.erp;

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
public class KeywordController {
	
	@Autowired
	private KeywordService keywordService;
	
	
	@RequestMapping(value="/keywordListForm.do")
	public ModelAndView keywordListForm(KeywordSearchDTO keywordSearchDTO,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		keywordSearchDTO.setKey_no(session.getAttribute("key_no"));
		keywordSearchDTO.setUser_no(session.getAttribute("user_no"));
		List<Map<String,String>> getKeywordList = this.keywordService.keywordListForm(keywordSearchDTO);	

		int keywordListAllCnt = this.keywordService.getKeywordListAllCnt( keywordSearchDTO );
		if( keywordListAllCnt>0 ){
			int beginRowNo= keywordSearchDTO.getSelectPageNo( )*keywordSearchDTO.getRowCntPerPage( )
							- keywordSearchDTO.getRowCntPerPage( )+1;
			if(keywordListAllCnt<beginRowNo) {
				keywordSearchDTO.setSelectPageNo(1);
			}
		}
//		System.out.println("받는키워드");
//		System.out.println(keywordSearchDTO.getKeyword1());
//		System.out.println(keywordListAllCnt);
//		
//		System.out.println("선택된 현재 페이지 번호");
//		System.out.println(keywordSearchDTO.getSelectPageNo());
//		
//		
//		
//		System.out.println("키워드리스트");
//		System.out.println(getKeywordList);
//		System.out.println("------------------------------");
		
		
		mav.setViewName("keywordListForm.jsp");
		mav.addObject("getKeywordList",getKeywordList);
		mav.addObject("keywordSearchDTO",keywordSearchDTO); 
		mav.addObject("keywordListAllCnt", keywordListAllCnt);
		
		return mav;	
	}
	
	
	//--------------------------------------------
	
	@RequestMapping("/keywordRegForm.do")
	public ModelAndView keywordRegForm(
			@RequestParam(value="key_no",		required=false,		defaultValue="0") String key_no	
			) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("keywordRegForm.jsp");
		mav.addObject("key_no", key_no);
		return mav;
	}
	
	@RequestMapping(value="/keywordRegProc.do"
					, method = RequestMethod.POST
					, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int insertKeyword(KeywordDTO keywordDTO) {
		
		System.out.println(keywordDTO.getKey_name());
		System.out.println(keywordDTO.getKey_content());
		int getInsertKeyword = this.keywordService.insertKeyword(keywordDTO);
		return getInsertKeyword;
	}
	
	//---------------------------------------------------------------------------------
	
	
	@RequestMapping("/keywordSearch.do")
	public ModelAndView keywordSearch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("keywordSearch.jsp");
		return mav;
	}

	
	// ----- 키워드 수정 및 삭제 페이지 -----
	
	@RequestMapping("/keywordUpDelForm.do")
	public ModelAndView keywordUpDelForm(KeywordDTO keywordDTO, 
					@RequestParam(value="key_no") String key_no){

		ModelAndView mav = new ModelAndView();
		
		KeywordDTO keywordList = this.keywordService.getKeywordList(keywordDTO);
		mav.setViewName("keywordUpDelForm.jsp");
		mav.addObject("keywordList", keywordList);
		return mav;
	}
	
	@RequestMapping(value="/keywordUpProc.do",
					method = RequestMethod.POST,
					produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int getKeywordCnt(KeywordDTO keywordDTO) {
			
		int keywordCnt = this.keywordService.getKeywordCnt(keywordDTO);
		return keywordCnt;
	}
	
	@RequestMapping(value="/keywordDelProc.do",
			method = RequestMethod.POST,
			produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int getKeywordCnt_Del(KeywordDTO keywordDTO) {
		
		int keywordCnt_Del = this.keywordService.getKeywordCnt_Del(keywordDTO);
		return keywordCnt_Del;
	}
	


}
	
