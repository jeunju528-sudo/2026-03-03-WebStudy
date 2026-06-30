package com.sist.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MovieModel {
	
	private String baseURL = "https://www.kobis.or.kr/kobis/business/main/";
	private String[] movie = {
			"",
			"searchMainDailyBoxOffice.do",
			"searchMainRealTicket.do",
			"searchMainDailySeatTicket.do"
	};
	
	@RequestMapping("js/movie_list.do")
	public void movieList(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		try {
			URI uri = new URI(baseURL+movie[Integer.parseInt(no)]);
			URL url = uri.toURL();
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			String json = "";
			if(conn != null) { // 사이트에 연결이 되었다면
				BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				while(true) {
					String s = in.readLine();
					if(s == null) {
						break;
					}
					json+=s;
				}
				conn.disconnect();
			}
//			System.out.println(json);
			response.setContentType("text/plain; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(json);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
