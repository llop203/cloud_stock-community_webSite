package com.cloudStock.erp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Parser_KoreaStock2 {
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

		Element stockDate = doc.select("td[align=center]").first().parent().child(0);
		Element stockDate2 = doc.select("td[align=center]").first().parent().nextElementSibling().child(0);

		String stockDate_str = stockDate.text().replace(".", "-");
		String stockDate2_str = stockDate2.text().replace(".", "-");
		
		arr_stockDate.add(stockDate_str);
		arr_stockDate.add(stockDate2_str);
		//--------------------------------------------------------------
		ArrayList<String> arr_closePrice = new ArrayList<String>();

		Element closePrice = doc.select("td[align=center]").first().parent().child(1);
		Element closePrice2 = doc.select("td[align=center]").first().parent().nextElementSibling().child(1);

		String closePrice_str = closePrice.text().replace(",", "");
		String closePrice2_str = closePrice2.text().replace(",", "");
		
		arr_closePrice.add(closePrice_str);
		arr_closePrice.add(closePrice2_str);
		//--------------------------------------------------------------
		ArrayList<String> arr_openPrice = new ArrayList<String>();

		Element openPrice = doc.select("td[align=center]").first().parent().child(3);
		Element openPrice2 = doc.select("td[align=center]").first().parent().nextElementSibling().child(3);

		String openPrice_str = openPrice.text().replace(",", "");
		String openPrice2_str = openPrice2.text().replace(",", "");
		
		arr_openPrice.add(openPrice_str);
		arr_openPrice.add(openPrice2_str);
		//--------------------------------------------------------------
		ArrayList<String> arr_highestPrice = new ArrayList<String>();

		Element highestPrice = doc.select("td[align=center]").first().parent().child(4);
		Element highestPrice2 = doc.select("td[align=center]").first().parent().nextElementSibling().child(4);

		String highestPrice_str = highestPrice.text().replace(",", "");
		String highestPrice2_str = highestPrice2.text().replace(",", "");
		
		arr_highestPrice.add(highestPrice_str);
		arr_highestPrice.add(highestPrice2_str);
		//--------------------------------------------------------------
		ArrayList<String> arr_lowestPrice = new ArrayList<String>();

		Element lowestPrice = doc.select("td[align=center]").first().parent().child(5);
		Element lowestPrice2 = doc.select("td[align=center]").first().parent().nextElementSibling().child(5);

		String lowestPrice_str = lowestPrice.text().replace(",", "");
		String lowestPrice2_str = lowestPrice2.text().replace(",", "");
		
		arr_lowestPrice.add(lowestPrice_str);
		arr_lowestPrice.add(lowestPrice2_str);
		//--------------------------------------------------------------
				
		ArrayList<ArrayList<String>> arr = new ArrayList<ArrayList<String>>();
		arr.add(arr_stockDate);
		arr.add(arr_closePrice);
		arr.add(arr_openPrice);
		arr.add(arr_highestPrice);
		arr.add(arr_lowestPrice);		
		
		return arr;
		
		
		
		/*
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

		for(int i=0 ; i<8 ; i++) {
			arr_stockDate.remove(2);
			arr_closePrice.remove(2);
			arr_openPrice.remove(2);
			arr_highestPrice.remove(2);
			arr_lowestPrice.remove(2);
		}

		//--------------------------------------------------------------
		ArrayList<ArrayList<String>> arr = new ArrayList<ArrayList<String>>();
		
		arr.add(arr_stockDate);
		arr.add(arr_closePrice);
		arr.add(arr_openPrice);
		arr.add(arr_highestPrice);
		arr.add(arr_lowestPrice);		
		
		return arr;
		//--------------------------------------------------------------
		*/
	}
}
