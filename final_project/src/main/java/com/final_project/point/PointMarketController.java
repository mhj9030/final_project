package com.final_project.point;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;
import com.final_project.talent.Talent;
import com.final_project.talent.TalentService;

@Controller("point.pointMarketController")
public class PointMarketController {
	@Autowired
	private PointService pService;
	
	@Autowired
	private TalentService tService;
	
	@Autowired
	private MyUtilBootstrap util;
	
	@RequestMapping(value="/point/market", method=RequestMethod.GET)
	public String marketList(@RequestParam(value="page", defaultValue="0")int current_page, 
			@RequestParam(value="mainCode", defaultValue="0")int mainCode, 
			@RequestParam(value="subCode", defaultValue="0")String subCode, 
			HttpSession session, Model model) throws Exception{
		Point dto = new Point();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("mId", info.getUserId());
		// 나의 포인트
		dto = pService.mypoint(map);
		
		List<Talent> mainType = new ArrayList<>();
		List<String> subCodes;
		try{
			subCodes = Arrays.asList(subCode);
		}catch (NullPointerException e) {
			subCodes = Arrays.asList("");
		}
		
		mainType = tService.mainType();
		
		map.put("mainCode", mainCode);
		map.put("list", subCodes);
		
		int total_page = 0;
		int rows = 6;
		int dataCount = tService.dataCount();
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = total_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Talent> list = tService.listBoard(map);
		list = tService.interestList(list);
		
		String paging = util.paging(current_page, total_page);
		
		model.addAttribute("mainType", mainType);
		model.addAttribute("mainCode", mainCode);
		model.addAttribute("subCode", subCode);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("point", dto);
		
		return ".point_layout.resume.market";
	}
	
	@ResponseBody
	@RequestMapping("/point/market/subType")
	public Map<String, Object> subType(@RequestParam(value="mainCode", defaultValue="0")int mainCode) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		
		List<Talent> subType = tService.subType(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("subType", subType);
		
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/point/market/usePoint")
	public void usePoint(HttpSession session, 
			@RequestParam int mypoint, 
			@RequestParam String seller) throws Exception {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> model = new HashMap<>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		// 포인트 use나 save 사용시 유의 사항
		// 종류가 하나라면 컨트롤러에서 map을 생성해 던지고 마켓서비스에서 usePoint만 부름
		// 종류가 여러개라면 마켓서비스에 usePoint에서 map도 같이 설정해야함
		
		// 포인트 사용
		if(mypoint-3000 >= 0){
			map.put("history", "이력서 열람");
			map.put("point", 3000);
			map.put("mId", info.getUserId());
			pService.usePoint(map);
			
			map = new HashMap<>();
			map.put("history", "공개 이력서 열람");
			map.put("point", 300);
			map.put("mId", seller);
			pService.savaPoint(map);
			
			// 이력서 보러가기
			model.put("state", 1);
		}else{
			// 포인트가 부족합니다.
			model.put("state", 0);
		}
		System.out.println(model.get("state"));
		return ;
	}
	
	@RequestMapping(value="/point/storagy", method=RequestMethod.GET)
	public String storagy(@RequestParam(value="page", defaultValue="0")int current_page, 
			@RequestParam(value="mainCode", defaultValue="0")int mainCode, 
			@RequestParam(value="subCode", defaultValue="0")String subCode, 
			HttpServletRequest req, Model model) throws Exception {
		List<Talent> mainType = new ArrayList<>();
		List<String> subCodes;
		try{
			subCodes = Arrays.asList(subCode);
		}catch (NullPointerException e) {
			subCodes = Arrays.asList("");
		}
		
		mainType = tService.mainType();
		
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		map.put("list", subCodes);
		
		int total_page = 0;
		int rows = 6;
		int dataCount = tService.dataCount(map);
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = total_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Talent> list = tService.listBoard(map);
		list = tService.interestList(list);
		
		String paging = util.paging(current_page, total_page);
		
		model.addAttribute("mainType", mainType);
		model.addAttribute("mainCode", mainCode);
		model.addAttribute("subCode", subCode);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return ".point_layout.resume.storagy";
	}
	
	@RequestMapping("/point/storagy/article")
	public String acticle(@RequestParam(value="page", defaultValue="0")int page, 
			@RequestParam("rNum") int rNum, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rNum", rNum);
		
		Talent introList = tService.readIntro(map);
		List<Talent> abilityList = null;
		abilityList = tService.readAbility(map);
		List<Talent> licenseList = null;
		licenseList = tService.readLicense(map);
		List<Talent> languageList = null;
		languageList = tService.readLanguage(map);
		List<Talent> projectList = null;
		projectList = tService.readProject(map);
		List<Talent> awardList = null;
		awardList = tService.readAward(map);
		List<Talent> careerList = null;
		careerList = tService.readCareer(map);
		
		model.addAttribute("rNum", rNum);
		model.addAttribute("page", page);
		model.addAttribute("introList", introList);
		model.addAttribute("abilityList", abilityList);
		model.addAttribute("licenseList", licenseList);
		model.addAttribute("languageList", languageList);
		model.addAttribute("projectList", projectList);
		model.addAttribute("awardList", awardList);
		model.addAttribute("careerList", careerList);
		
		return ".point_layout.resume.article";
	}
}