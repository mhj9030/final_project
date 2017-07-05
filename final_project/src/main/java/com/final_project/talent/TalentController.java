package com.final_project.talent;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			@RequestParam(value="startDate", defaultValue="")String startDate, 
			@RequestParam(value="endDate", defaultValue="")String endDate, 
			Model model) throws Exception {
		List<Talent> mainType = new ArrayList<>();
		mainType = service.mainType();
		
		
		model.addAttribute("mainType", mainType);
		model.addAttribute("mainCode", mainCode);
		//model.addAttribute("subCode", subCode);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		return ".talent_layout.main.container";
	}
	
	@ResponseBody
	@RequestMapping("/talent/main/subType")
	public Map<String, Object> subType(@RequestParam(value="mainCode")int mainCode) throws Exception {
		System.out.println(">>> " + mainCode);
		
		List<Talent> subType;
		Map<String, Object> map = new HashMap<>();
		
		map.put("mainCode", mainCode);
		subType = service.subType(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("subType", subType);
		
		return model;
	}
}