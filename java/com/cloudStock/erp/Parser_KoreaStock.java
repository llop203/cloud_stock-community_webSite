package com.cloudStock.erp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Parser_KoreaStock {
	public ArrayList<ArrayList<String>> parseToURL(String url) {
		//--------------------------------------------------------------
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//--------------------------------------------------------------
		
		
		//--------------------------------------------------------------
		ArrayList<String> arr_stockDate = new ArrayList<String>();

		Elements stockDate = doc.select("td[align=center]");
		String stockDate_str = "";

		for(Element e : stockDate) {
			stockDate_str = e.text();
			stockDate_str = stockDate_str.replace(".", "-");
			arr_stockDate.add(stockDate_str);
		}
		//--------------------------------------------------------------
		ArrayList<String> arr_closePrice = new ArrayList<String>();

		Elements closePrice = doc.select("td[align=center]").next();
		String closePrice_str = "";

		for(Element e : closePrice) {
			closePrice_str = e.text();
			closePrice_str = closePrice_str.replace(",", "");
			arr_closePrice.add(closePrice_str);
		}		
		//--------------------------------------------------------------
		ArrayList<String> arr_openPrice = new ArrayList<String>();

		Elements openPrice = doc.select("td[align=center]").next().next().next();
		String openPrice_str = "";

		for(Element e : openPrice) {
			openPrice_str = e.text();
			openPrice_str = openPrice_str.replace(",", "");
			arr_openPrice.add(openPrice_str);
		}		
		//--------------------------------------------------------------
		ArrayList<String> arr_highestPrice = new ArrayList<String>();

		Elements highestPrice = doc.select("td[align=center]").next().next().next().next();
		String highestPrice_str = "";

		for(Element e : highestPrice) {
			highestPrice_str = e.text();
			highestPrice_str = highestPrice_str.replace(",", "");
			arr_highestPrice.add(highestPrice_str);
		}		
		//--------------------------------------------------------------
		ArrayList<String> arr_lowestPrice = new ArrayList<String>();

		Elements lowestPrice = doc.select("td[align=center]").next().next().next().next().next();
		String lowestPrice_str = "";

		for(Element e : lowestPrice) {
			lowestPrice_str = e.text();
			lowestPrice_str = lowestPrice_str.replace(",", "");
			arr_lowestPrice.add(lowestPrice_str);
		}		
		//--------------------------------------------------------------
		/*
		for(int i=0 ; i<8 ; i++) {
			arr_stockDate.remove(2);
			arr_closePrice.remove(2);
			arr_openPrice.remove(2);
			arr_highestPrice.remove(2);
			arr_lowestPrice.remove(2);
		}
		*/
		//--------------------------------------------------------------
		ArrayList<ArrayList<String>> arr = new ArrayList<ArrayList<String>>();
		
		arr.add(arr_stockDate);
		arr.add(arr_closePrice);
		arr.add(arr_openPrice);
		arr.add(arr_highestPrice);
		arr.add(arr_lowestPrice);		
		
		return arr;
		//--------------------------------------------------------------
	}

}
