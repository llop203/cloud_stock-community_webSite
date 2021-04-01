package com.cloudStock.erp;

import java.util.ArrayList;
import java.util.Collections;
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
public class StockController {
	@Autowired
	private StockService stockService;
	
	@RequestMapping("/stockForm.do")
	public ModelAndView stockForm() {		
		//--------------------------------------------------------------
		Parser_KoreaStock urlParser1 = new Parser_KoreaStock();
		String url1 = "https://finance.naver.com/item/sise_day.nhn?code=";
		String url2 = "&page=";
		String samjeon = "005930";
		String kakao = "035720";
		//--------------------------------------------------------------
		ArrayList<String> stockDateList = new ArrayList<String>();
		ArrayList<String> closePriceList = new ArrayList<String>();	
		ArrayList<String> openPriceList = new ArrayList<String>();	
		ArrayList<String> highestPriceList = new ArrayList<String>();	
		ArrayList<String> lowestPriceList = new ArrayList<String>();			

		for(int i=1 ; i<11 ; i++) {
			stockDateList.addAll(urlParser1.parseToURL(url1 + samjeon + url2 + i).get(0));
			closePriceList.addAll(urlParser1.parseToURL(url1 + samjeon + url2 + i).get(1));
			openPriceList.addAll(urlParser1.parseToURL(url1 + samjeon + url2 + i).get(2));
			highestPriceList.addAll(urlParser1.parseToURL(url1 + samjeon + url2 + i).get(3));
			lowestPriceList.addAll(urlParser1.parseToURL(url1 + samjeon + url2 + i).get(4));
		}	
		
		Collections.reverse(stockDateList);
		Collections.reverse(closePriceList);
		Collections.reverse(openPriceList);
		Collections.reverse(highestPriceList);
		Collections.reverse(lowestPriceList);
		//--------------------------------------------------------------
		ArrayList<String> stockDateList2 = new ArrayList<String>();
		ArrayList<String> closePriceList2 = new ArrayList<String>();	
		ArrayList<String> openPriceList2 = new ArrayList<String>();	
		ArrayList<String> highestPriceList2 = new ArrayList<String>();	
		ArrayList<String> lowestPriceList2 = new ArrayList<String>();			

		for(int i=1 ; i<11 ; i++) {
			stockDateList2.addAll(urlParser1.parseToURL(url1 + kakao + url2 + i).get(0));
			closePriceList2.addAll(urlParser1.parseToURL(url1 + kakao + url2 + i).get(1));
			openPriceList2.addAll(urlParser1.parseToURL(url1 + kakao + url2 + i).get(2));
			highestPriceList2.addAll(urlParser1.parseToURL(url1 + kakao + url2 + i).get(3));
			lowestPriceList2.addAll(urlParser1.parseToURL(url1 + kakao + url2 + i).get(4));
		}	
		
		Collections.reverse(stockDateList2);
		Collections.reverse(closePriceList2);
		Collections.reverse(openPriceList2);
		Collections.reverse(highestPriceList2);
		Collections.reverse(lowestPriceList2);
		//--------------------------------------------------------------
		ModelAndView mav = new ModelAndView();
		mav.setViewName("stockForm.jsp");
		mav.addObject("size", stockDateList.size()-1);
		
		mav.addObject("stockDateList", stockDateList);
		mav.addObject("closePriceList", closePriceList);
		mav.addObject("openPriceList", openPriceList);
		mav.addObject("highestPriceList", highestPriceList);
		mav.addObject("lowestPriceList", lowestPriceList);
		
		mav.addObject("stockDateList2", stockDateList2);
		mav.addObject("closePriceList2", closePriceList2);
		mav.addObject("openPriceList2", openPriceList2);
		mav.addObject("highestPriceList2", highestPriceList2);
		mav.addObject("lowestPriceList2", lowestPriceList2);
		
		return mav;
		//--------------------------------------------------------------
	}

	@RequestMapping("/stockForm2.do")
	public ModelAndView stockForm2() {			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("stockForm2.jsp");
		return mav;
	}	
	
	@RequestMapping(
			value="/stockProc.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int insertStock(
			HttpSession session
			, StockDTO stockDTO
	) {
		int insertStockCnt = this.stockService.insertStock(stockDTO);
		return insertStockCnt;
	}
	

}
