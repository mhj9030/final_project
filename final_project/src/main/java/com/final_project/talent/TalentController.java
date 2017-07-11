package com.final_project.talent;

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
	public String list(@RequestParam(value="mainCode", defaultValue="0")int mainCode, 
			//@RequestParam(value="subCode", defaultValue="0")int[] subCode, 
			//String[] subCode, 
			HttpServletRequest request,
			@RequestParam(value="page", defaultValue="0")int current_page, 
			Model model) throws Exception {
		List<Talent> mainType = new ArrayList<>();
		
		String[] subCode = request.getParameterValues("subCode");
		System.out.println(subCode);
		//List<String> codeList = Arrays.asList(subCode);
		
		//System.out.println(codeList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		//map.put("list", codeList);
		
		mainType = service.mainType();
		
		/*int total_page = 0;
		int rows = 6;
		int dataCount = service.dataCount();
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = total_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Talent> list;
		list = service.listBoard(map);*/
		
		//String paging = util.paging(current_page, total_page);
		
		model.addAttribute("mainType", mainType);
		model.addAttribute("mainCode", mainCode);
		model.addAttribute("subCode", subCode);
		//model.addAttribute("list", list);
		//model.addAttribute("paging", paging);
		
		return ".talent_layout.main.list";
	}
	
	@ResponseBody
	@RequestMapping("/talent/main/subType")
	public Map<String, Object> subType(@RequestParam(value="mainCode")int mainCode) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		
		List<Talent> subType = service.subType(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("subType", subType);
		
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/talent/main/searchList")
	public Map<String, Object> searchList(@RequestParam(value="mainCode", defaultValue="0")int mainCode, 
			String[] subCode, 
			@RequestParam(value="page", defaultValue="0")int current_page
			) throws Exception {
		List<String> subCodes;
		try{
			subCodes = Arrays.asList(subCode);
		}catch (NullPointerException e) {
			subCodes = Arrays.asList("");
		}
		System.out.println(">>> " + subCodes);
		
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		map.put("list", subCodes);
		
		int total_page = 0;
		int rows = 6;
		int dataCount = service.dataCount(map);
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = total_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Talent> list;
		list = service.listBoard(map);
		list = service.interestList(list);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		
		return model;
	}
	
	@RequestMapping("/talent/main/article")
	public String article(){
		Map<String, Object> map = new HashMap<>();
		
		Talent dto;
		dto = service.readList(map);
		
		List<Talent> list = new ArrayList<>();
		list.add(dto);
		list = service.interestList(list);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		
		return ".talent_layout.main.article";
	}
}