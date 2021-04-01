package com.cloudStock.erp;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CrawlingController {
	

	@Autowired
	private CrawlingService crawlingService;
	
	@RequestMapping("/crawlingForm.do")
	public ModelAndView crawlingForm(CrawlingDTO crawlingDTO, CrawlingSearchDTO crawlingSearchDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("crawlingForm.jsp");
		
		if(crawlingDTO.getSelectedStockCode1() != null && crawlingDTO.getSelectedStockCode1().length() != 0) {
			Map<String,String> selectedStockMap1 = this.crawlingService.getSelectedStockMap1(crawlingDTO);
			mav.addObject("selectedStockMap1", selectedStockMap1);
		}
		if(crawlingDTO.getSelectedStockCode2() != null && crawlingDTO.getSelectedStockCode2().length() != 0) {
			Map<String,String> selectedStockMap2 = this.crawlingService.getSelectedStockMap2(crawlingDTO);
			mav.addObject("selectedStockMap2", selectedStockMap2);
		}
		if(crawlingDTO.getSelectedStockCode3() != null && crawlingDTO.getSelectedStockCode3().length() != 0) {
			Map<String,String> selectedStockMap3 = this.crawlingService.getSelectedStockMap3(crawlingDTO);
			mav.addObject("selectedStockMap3", selectedStockMap3);
		}

		List<Map<String,String>> topRankStockList = this.crawlingService.getTopRankStockList(crawlingDTO); 		
		Map<String,String> topRankStockMap1 = topRankStockList.get(0);
		Map<String,String> topRankStockMap2 = topRankStockList.get(1); 
		Map<String,String> topRankStockMap3 = topRankStockList.get(2);		
		mav.addObject("topRankStockMap1", topRankStockMap1);
		mav.addObject("topRankStockMap2", topRankStockMap2);
		mav.addObject("topRankStockMap3", topRankStockMap3);
		
		String standardStockDate = this.crawlingService.getStandardStockDate(crawlingDTO);
		mav.addObject("standardStockDate", standardStockDate);
		
		return mav;
	}
	
	@RequestMapping(
				value="/crawlingProc.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public List<Map<String,String>> getStockList(
			CrawlingSearchDTO crawlingSearchDTO
			,CrawlingDTO crawlingDTO
	){		
		String orderby_rateOfReturn = crawlingSearchDTO.getOrderby_rateOfReturn_1() + "/" + crawlingSearchDTO.getOrderby_rateOfReturn_2() + "/" + crawlingSearchDTO.getOrderby_rateOfReturn_3();
		String[] arr_orderby_rateOfReturn = orderby_rateOfReturn.split("/");
		for(int l=0 ; l<arr_orderby_rateOfReturn.length ; l++) {
			if(arr_orderby_rateOfReturn[l].length() != 4) {
				crawlingSearchDTO.setOrderby_rateOfReturn(arr_orderby_rateOfReturn[l]);	
			}
		}
		
		int stockListAllCnt = this.crawlingService.getStockListAllCnt(crawlingSearchDTO);
		
		List<Map<String,String>> stockList = this.crawlingService.getStockList(crawlingSearchDTO);

		String[] rateOfReturns = crawlingSearchDTO.getRateOfReturn();

		for(int i=0 ; i<stockList.size() ; i++) {
			String stock_code = stockList.get(i).get("stock_code");
			crawlingDTO.setStock_code(stock_code);
			
			String[] close_prices = stockList.get(i).get("close_prices").split(",");
			
			int close_price_today = Integer.parseInt(close_prices[0]);
			
			for(int j=1 ; j<close_prices.length ; j++) {
				
				if(close_prices[j] != null) {
					
					for(int k=0 ; k<rateOfReturns.length ; k++ ) {
						if(Integer.parseInt(rateOfReturns[k]) == j) {
							
							int close_price = Integer.parseInt(close_prices[j]);
							if(close_price_today < close_price) {
								crawlingDTO.setRateOfReturns(j);//
								double rateOfReturn_double = Math.round( (((close_price_today*1.0/close_price)-1)*100) *100)/100.0;//
								crawlingDTO.setRateOfReturns_double(rateOfReturn_double);//
								int updateCnt = this.crawlingService.update_rateOfReturn(crawlingDTO);
						
								String rateOfReturn = "" + Math.round( (((close_price_today*1.0/close_price)-1)*100) *100)/100.0 + "%";
								stockList.get(i).put("rateOfReturn_"+(k+1), rateOfReturn);
								stockList.get(i).put("stockListAllCnt", stockListAllCnt+"");
							}else{
								crawlingDTO.setRateOfReturns(j);//
								double rateOfReturn_double = Math.round( (((close_price_today*1.0/close_price)-1)*100) *100)/100.0;
								crawlingDTO.setRateOfReturns_double(rateOfReturn_double);//
								int updateCnt = this.crawlingService.update_rateOfReturn(crawlingDTO);
								
								String rateOfReturn = "+" + Math.round( (((close_price_today*1.0/close_price)-1)*100) *100)/100.0 + "%";
								stockList.get(i).put("rateOfReturn_"+(k+1), rateOfReturn);
								stockList.get(i).put("stockListAllCnt", stockListAllCnt+"");
							}	
							
						}
					}
					
				}
				else {
					for(int k=0 ; k<rateOfReturns.length ; k++ ) {
						if(Integer.parseInt(rateOfReturns[k]) == j) {
							crawlingDTO.setRateOfReturns(j);//
							double rateOfReturn_double = 0*1.0;
							crawlingDTO.setRateOfReturns_double(rateOfReturn_double);//
							int updateCnt = this.crawlingService.update_rateOfReturn(crawlingDTO);
							
							stockList.get(i).put("rateOfReturn_"+(k+1), "");
							stockList.get(i).put("stockListAllCnt", stockListAllCnt+"");
						}
					}
				}
			}
		}		

		
		List<Map<String,String>> stockList2 = this.crawlingService.getStockList2(crawlingSearchDTO);
		
		for(int i=0 ; i<stockList2.size() ; i++) {	
			for(int k=0 ; k<rateOfReturns.length ; k++ ) {
				if(Integer.parseInt(rateOfReturns[k]) == 1) {
					if(stockList2.get(i).get("month1") != null) {
						double month_double = Double.parseDouble(stockList2.get(i).get("month1"));
						String month = "";
						if(month_double <= 0) {
							month = "" + month_double + "%";
						}
						else if(month_double > 0) {
							month = "+" + month_double + "%";
						} 
						stockList2.get(i).put("rateOfReturn_"+(k+1), month);
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
					else {
						stockList2.get(i).put("rateOfReturn_"+(k+1), "");
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
				}
				else if(Integer.parseInt(rateOfReturns[k]) == 2) {
					if(stockList2.get(i).get("month3") != null) {
						double month_double = Double.parseDouble(stockList2.get(i).get("month3"));
						String month = "";
						if(month_double <= 0) {
							month = "" + month_double + "%";
						}
						else if(month_double > 0) {
							month = "+" + month_double + "%";
						} 
						stockList2.get(i).put("rateOfReturn_"+(k+1), month);
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
					else {
						stockList2.get(i).put("rateOfReturn_"+(k+1), "");
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
				}
				else if(Integer.parseInt(rateOfReturns[k]) == 3) {
					if(stockList2.get(i).get("month6") != null) {
						double month_double = Double.parseDouble(stockList2.get(i).get("month6"));
						String month = "";
						if(month_double <= 0) {
							month = "" + month_double + "%";
						}
						else if(month_double > 0) {
							month = "+" + month_double + "%";
						} 
						stockList2.get(i).put("rateOfReturn_"+(k+1), month);
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
					else {
						stockList2.get(i).put("rateOfReturn_"+(k+1), "");
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
				}
				else if(Integer.parseInt(rateOfReturns[k]) == 4) {
					if(stockList2.get(i).get("month12") != null) {
						double month_double = Double.parseDouble(stockList2.get(i).get("month12"));
						String month = "";
						if(month_double <= 0) {
							month = "" + month_double + "%";
						}
						else if(month_double > 0) {
							month = "+" + month_double + "%";
						} 
						stockList2.get(i).put("rateOfReturn_"+(k+1), month);
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
					else {
						stockList2.get(i).put("rateOfReturn_"+(k+1), "");
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
				}
				else if(Integer.parseInt(rateOfReturns[k]) == 5) {
					if(stockList2.get(i).get("month36") != null) {
						double month_double = Double.parseDouble(stockList2.get(i).get("month36"));
						String month = "";
						if(month_double <= 0) {
							month = "" + month_double + "%";
						}
						else if(month_double > 0) {
							month = "+" + month_double + "%";
						} 
						stockList2.get(i).put("rateOfReturn_"+(k+1), month);
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
					else {
						stockList2.get(i).put("rateOfReturn_"+(k+1), "");
						stockList2.get(i).put("stockListAllCnt", stockListAllCnt+"");
					}
				}
			}
		}		
		
		return stockList2;
	}

	@RequestMapping("/crawlingInfoForm.do")
	public ModelAndView crawlingInfoForm(CrawlingDTO crawlingDTO) {
		int updateCnt = this.crawlingService.updateSelected_Cnt(crawlingDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("crawlingInfoForm.jsp");
		
		Map<String,String> selectedStockMap1 = null;
		Map<String,String> selectedStockMap2 = null;
		Map<String,String> selectedStockMap3 = null;
		
		if(crawlingDTO.getSelectedStockCode1() != null && crawlingDTO.getSelectedStockCode1().length() != 0) {
			selectedStockMap1 = this.crawlingService.getSelectedStockMap1(crawlingDTO);
			mav.addObject("selectedStockMap1", selectedStockMap1);
		}
		if(crawlingDTO.getSelectedStockCode2() != null && crawlingDTO.getSelectedStockCode2().length() != 0) {
			selectedStockMap2 = this.crawlingService.getSelectedStockMap2(crawlingDTO);
			mav.addObject("selectedStockMap2", selectedStockMap2);
		}
		if(crawlingDTO.getSelectedStockCode3() != null && crawlingDTO.getSelectedStockCode3().length() != 0) {
			selectedStockMap3 = this.crawlingService.getSelectedStockMap3(crawlingDTO);
			mav.addObject("selectedStockMap3", selectedStockMap3);
		}
		
		List<Map<String,String>> topRankStockList = this.crawlingService.getTopRankStockList(crawlingDTO); 		
		Map<String,String> topRankStockMap1 = topRankStockList.get(0);
		Map<String,String> topRankStockMap2 = topRankStockList.get(1); 
		Map<String,String> topRankStockMap3 = topRankStockList.get(2);		
		mav.addObject("topRankStockMap1", topRankStockMap1);
		mav.addObject("topRankStockMap2", topRankStockMap2);
		mav.addObject("topRankStockMap3", topRankStockMap3);
		
		List<Map<String,String>> selectedStockList = this.crawlingService.getSelectedStockList(crawlingDTO);
		mav.addObject("selectedStockList", selectedStockList);


		Map<String,Double> selectedStockROR1 = null;
		Map<String,Double> selectedStockROR2 = null;
		Map<String,Double> selectedStockROR3 = null;

		if(crawlingDTO.getSelectedStockCode1() != null && crawlingDTO.getSelectedStockCode1().length() != 0) {
			selectedStockROR1 = this.crawlingService.getSelectedStockROR1(crawlingDTO);
			mav.addObject("selectedStockROR1", selectedStockROR1);
		}
		if(crawlingDTO.getSelectedStockCode2() != null && crawlingDTO.getSelectedStockCode2().length() != 0) {
			selectedStockROR2 = this.crawlingService.getSelectedStockROR2(crawlingDTO);
			mav.addObject("selectedStockROR2", selectedStockROR2);
		}
		if(crawlingDTO.getSelectedStockCode3() != null && crawlingDTO.getSelectedStockCode3().length() != 0) {
			selectedStockROR3 = this.crawlingService.getSelectedStockROR3(crawlingDTO);		
			mav.addObject("selectedStockROR3", selectedStockROR3);
		}

		List<Map<String,String>> stockDateList1 = null;
		List<Map<String,String>> stockDateList2 = null;
		List<Map<String,String>> stockDateList3 = null;
		List<Map<String,Integer>> closePriceList1 = null;
		List<Map<String,Integer>> closePriceList2 = null;
		List<Map<String,Integer>> closePriceList3 = null;
		
		if(crawlingDTO.getSelectedStockCode1() != null && crawlingDTO.getSelectedStockCode1().length() != 0) {
			stockDateList1 = this.crawlingService.getStockDateList1(crawlingDTO); 
			mav.addObject("stockDateList1", stockDateList1);
			closePriceList1 = this.crawlingService.getClosePriceList1(crawlingDTO); 
			mav.addObject("closePriceList1", closePriceList1);
		}
		if(crawlingDTO.getSelectedStockCode2() != null && crawlingDTO.getSelectedStockCode2().length() != 0) {
			stockDateList2 = this.crawlingService.getStockDateList2(crawlingDTO); 
			mav.addObject("stockDateList2", stockDateList2);
			closePriceList2 = this.crawlingService.getClosePriceList2(crawlingDTO); 	
			mav.addObject("closePriceList2", closePriceList2); 
		}
		if(crawlingDTO.getSelectedStockCode3() != null && crawlingDTO.getSelectedStockCode3().length() != 0) {
			stockDateList3 = this.crawlingService.getStockDateList3(crawlingDTO); 
			mav.addObject("stockDateList3", stockDateList3);
			closePriceList3 = this.crawlingService.getClosePriceList3(crawlingDTO);
			mav.addObject("closePriceList3", closePriceList3);
		}
		return mav;
	}
	
}






















