package com.final_project.talent;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.final_project.common.MyUtilBootstrap;

@Controller("talent.talentController")
public class TalentController {
	@Autowired
	private TalentService service;
	
	@Autowired
	private MyUtilBootstrap util;
	
	@RequestMapping("/talent/main")
	public String list(@RequestParam(value="page", defaultValue="1")int current_page, 
			@RequestParam(value="mainCode", defaultValue="0")int mainCode, 
			HttpServletRequest request, HttpServletRequest req, Model model) throws Exception {
		List<Talent> mainType = new ArrayList<>();
		
		String[] subCode = request.getParameterValues("subCode");
		
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		
		mainType = service.mainType();
		
		int total_page = 0;
		int rows = 6;
		int dataCount = service.dataCount(map);
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Talent> list = service.listBoard(map);
		list = service.interestList(list);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/talent/main";
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		model.addAttribute("mainType", mainType);
		model.addAttribute("mainCode", mainCode);
		model.addAttribute("subCode", subCode);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("paging", paging);
		
		return ".talent_layout.main.list";
	}
	
	@ResponseBody
	@RequestMapping("/talent/main/subType")
	public Map<String, Object> subType(@RequestParam(value="page", defaultValue="1")int current_page, 
			@RequestParam(value="mainCode")int mainCode, HttpServletRequest req) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		
		List<Talent> subType = service.subType(map);
		
		int total_page = 0;
		int rows = 6;
		int dataCount = service.dataCount(map);
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Talent> list = service.listBoard(map);
		list = service.interestList(list);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/talent/main";
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		Map<String, Object> model = new HashMap<>();
		model.put("subType", subType);
		model.put("list", list);
		model.put("listUrl", listUrl);
		model.put("paging", paging);
		
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/talent/main/searchList")
	public Map<String, Object> searchList(@RequestParam(value="page", defaultValue="1")int current_page, 
			@RequestParam(value="mainCode", defaultValue="0")int mainCode, 
			String[] subCode, HttpServletRequest req) throws Exception {
		List<String> subCodes;
		
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		try{
			subCodes = Arrays.asList(subCode);
			map.put("list", subCodes);
		}catch (NullPointerException e) {
			map.put("list", null);
		}
		
		int total_page = 0;
		int rows = 6;
		int dataCount = service.dataCount(map);
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Talent> list = service.listBoard(map);
		list = service.interestList(list);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/talent/main";
		String articleUrl = cp+"/talent/article?page=" + current_page;
        if(mainCode!=0) {
        	query = "mainCode=" +mainCode;
        	if(subCode.length!=0){
        		query += "subCode=" + subCode;
        	}
        }
        
        if(query.length()!=0) {
        	listUrl = cp + "/talent/main?" + query;
        	articleUrl = cp + "/talent/article?page=" + current_page + "&"+ query;
        }
		
		String paging = util.paging(current_page, total_page, listUrl);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		model.put("articleUrl", articleUrl);
		model.put("paging", paging);
		
		return model;
	}
}