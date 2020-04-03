package com.utilities;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class GetConnection {
	
	public static List<String> getData(String country) throws Exception {
		List<String> list = new ArrayList<>();
		String url = "https://www.worldometers.info/coronavirus/country/" + country + "/";
		Document doc = Jsoup.connect(url).get();
		
		// get value from #maincounter-number
		Elements element = doc.select("#maincounter-wrap");
		//Elements img = doc.select(".content-inner");
		element.forEach(e -> {
			String count = e.select(".maincounter-number>span").text();
			list.add(count);
		});
		/*for(Element el : img) {
			String src = el.select("div>h1>div>img").attr("src");
			list.add("www.worldometers.info" + src);
		}
		*/
		return list;
	}
	
	public static List<String> getData() throws Exception {
		List<String> list = new ArrayList<>();
		String url = "https://www.worldometers.info/coronavirus/";
		Document doc = Jsoup.connect(url).get();
		
		// get value from #maincounter-number
		Elements element = doc.select("#maincounter-wrap");
		//Elements img = doc.select(".content-inner");
		element.forEach(e -> {
			String count = e.select(".maincounter-number>span").text();
			list.add(count);
		});
		/*for(Element el : img) {
			String src = el.select("div>h1>div>img").attr("src");
			list.add("www.worldometers.info" + src);
		}
		*/
		return list;
	}
	
	//Method to check if string has numbers
	public static boolean hasNumberInString(String s) {
		char[] chars = s.toCharArray();
		for(char c: chars) {
			if(Character.isDigit(c)) {
				return true;
			}
		}
		return false;
	}
}
