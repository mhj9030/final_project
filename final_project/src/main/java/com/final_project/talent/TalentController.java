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
	public String list(@RequestParam(value="page", defaultValue="0")int current_page, 
			@RequestParam(value="mainCode", defaultValue="0")int mainCode, 
			//String[] subCode, 
			HttpServletRequest request, Model model) throws Exception {
		List<Talent> mainType = new ArrayList<>();
		
		String[] subCode = request.getParameterValues("subCode");
		System.out.println(subCode);
		//List<String> codeList = Arrays.asList(subCode);
		
		//System.out.println(codeList);
		
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		
		mainType = service.mainType();
		
		model.addAttribute("mainType", mainType);
		model.addAttribute("mainCode", mainCode);
		model.addAttribute("subCode", subCode);
		
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
		
		//String paging = util.paging(current_page, total_page);
		
		Map<String, Object> model = new HashMap<>();
		model.put("list", list);
		//model.put("paging", paging);
		
		return model;
	}
	
	@RequestMapping("/talent/main/article")
	public String article(@RequestParam(value="page", defaultValue="0")int page, 
			@RequestParam("rNum") int rNum, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rNum", rNum);
		
		Talent introList = service.readIntro(map);
		List<Talent> abilityList = null;
		abilityList = service.readAbility(map);
		List<Talent> licenseList = null;
		licenseList = service.readLicense(map);
		List<Talent> languageList = null;
		languageList = service.readLanguage(map);
		List<Talent> projectList = null;
		projectList = service.readProject(map);
		List<Talent> awardList = null;
		awardList = service.readAward(map);
		List<Talent> careerList = null;
		careerList = service.readCareer(map);
		
		model.addAttribute("rNum", rNum);
		model.addAttribute("page", page);
		model.addAttribute("introList", introList);
		model.addAttribute("abilityList", abilityList);
		model.addAttribute("licenseList", licenseList);
		model.addAttribute("languageList", languageList);
		model.addAttribute("projectList", projectList);
		model.addAttribute("awardList", awardList);
		model.addAttribute("careerList", careerList);
		
		return ".talent_layout.main.article";
	}
}