package com.final_project.employ;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("employ.GovController")
public class GovController {
	@Autowired
	EmployService service;
	
	@RequestMapping("/employ/gov")
	public String search(Model model) {
		 //메인업종리스트,서브업종리스트
		List<Employ> mblist= service.list_main_bu_class();
		List<Employ> sblist= service.list_sub_bu_class();
		
		//메인직종리스트,서브직종리스트
		List<Employ> mjlist= service.list_main_class();
		List<Employ> sjlist= service.list_sub_class();
		//자격증
		List<Employ> lclist=service.list_license();
		//우대사항
		List<Employ> cePlist = service.list_cePrefere();
		//근무조건
		List<Employ> ceTlist = service.list_ceType();
		//학력
		List<Employ> lalist = service.list_ability();
		int dataCount = service.dataCount();
		//지금 해야되는거 우대사항 학력 자격증 근무조건 컨트롤러로 받아와서 검색 바뀌게한다.
		//한개 먼저한다. 우대사항
		model.addAttribute("dataCount",dataCount);
		
		model.addAttribute("lalist",lalist);
		model.addAttribute("sblist",sblist);
		model.addAttribute("mblist",mblist);
		model.addAttribute("sjlist",sjlist);
		model.addAttribute("mjlist",mjlist);
		model.addAttribute("lclist",lclist);
		model.addAttribute("cePlist",cePlist);
		model.addAttribute("ceTlist",ceTlist);
		model.addAttribute("gov","on");
		return ".employ_layout.gov.search";

	}
	
	@RequestMapping("/employ/gov/article")
	public String article(Model model) {
		
		model.addAttribute("gov","on");
		return ".employ_layout.gov.article";

	}
	
	
	@RequestMapping(value="/ajax/ajax")
	public void ajax(HttpServletResponse resp) throws Exception {
		List<String> list = new ArrayList<>();
		//StringBuilder urlBuilder = new StringBuilder("http://openapi.mpm.go.kr/openapi/service/RetrievePblinsttEmpmnInfoService/getItem"); /*URL*/
       // urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=0OoVB%2FOzdU0c9SDM68nKM4EBuI%2BJ7YxTjBQ85rgdj2lr9NSCqz%2FeUyK4%2B0UdsJ0eoKbVP8dLLm7dzIOIz5pQdg%3D%3D"); /*Service Key*/
       // urlBuilder.append("&" + URLEncoder.encode("idx","UTF-8") + "=" + URLEncoder.encode("1212", "UTF-8")); /*공공취업정보일렬번호*/
			 StringBuilder urlBuilder = new StringBuilder("http://openapi.mpm.go.kr/openapi/service/RetrievePblinsttEmpmnInfoService/getInsttList");
		        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=0OoVB%2FOzdU0c9SDM68nKM4EBuI%2BJ7YxTjBQ85rgdj2lr9NSCqz%2FeUyK4%2B0UdsJ0eoKbVP8dLLm7dzIOIz5pQdg%3D%3D"); 
		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("Pblanc_ty","UTF-8") + "=" + URLEncoder.encode("e01", "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("Instt_se","UTF-8") + "=" + URLEncoder.encode("g01", "UTF-8"));  
		        urlBuilder.append("&" + URLEncoder.encode("Instt_nm","UTF-8") + "=" + URLEncoder.encode("서울", "UTF-8"));
		        urlBuilder.append("&" + URLEncoder.encode("Area_cd","UTF-8") + "=" + URLEncoder.encode("SU01", "UTF-8"));
		        urlBuilder.append("&" + URLEncoder.encode("Begin_de","UTF-8") + "=" + URLEncoder.encode("06/15/2017", "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("End_de","UTF-8") + "=" + URLEncoder.encode("10/25/2018", "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("Kwrd","UTF-8") + "=" + URLEncoder.encode("소방서", "UTF-8")); 
		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 
	
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("GET");
		        conn.setRequestProperty("Content-type", "application/xml");
		        System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line = "";
		        System.out.println(line);
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        
		        String data = sb.toString();
		        
		        list.add(data);
		        System.out.println(data);
		        rd.close();
		        conn.disconnect();
		        System.out.println(data);
		        resp.setContentType("text/xml;charset=utf-8");
		        PrintWriter out = resp.getWriter();
		        out.print(data);
			
	
	    }
	
	
	//xml로 보내면 json으로 받는거 해본다.
	//매핑된 url 들어가면 메소드 실행될거고 받은 api정보  vo,list에담고 모델에 넣어서 출력해본다.
	
	
}
