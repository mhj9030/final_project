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
	public String marketList(@RequestParam(value="page", defaultValue="1")int current_page, 
			@RequestParam(value="mainCode", defaultValue="0")int mainCode, 
			@RequestParam(value="subCode", defaultValue="")String subCode, 
			HttpSession session, HttpServletRequest req, Model model) throws Exception{
		Point dto = new Point();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("mId", info.getUserId());
		// 나의 포인트
		dto = pService.mypoint(map);
		
		List<Talent> mainType = new ArrayList<>();
		
		if(subCode!=null && ! subCode.equals("")){
			List<String> subCodes = Arrays.asList(subCode);
			map.put("list", subCodes);
		}else{
			map.put("list", null);
		}
		
		mainType = tService.mainType();
		
		if(mainCode!=0)
			map.put("mainCode", mainCode);
		
		int total_page = 0;
		int rows = 6;
		int dataCount = tService.dataCount();
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Talent> list = tService.listBoard(map);
		list = tService.interestList(list);
		list = tService.isBuy(list, map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/point/market";
        if(mainCode!=0) {
        	query = "mainCode=" + mainCode;
        	if(subCode!=null && ! subCode.equals("")){
        		query += "&subCode=" + subCode;
        	}
        }
        
        if(query.length()!=0) {
        	listUrl = cp + "/point/market?" + query;
        }
        
		String paging = util.paging(current_page, total_page, listUrl);
		
		model.addAttribute("page", current_page);
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
	public Map<String, Object> subType(@RequestParam(value="page", defaultValue="1")int current_page, 
			@RequestParam(value="mainCode", defaultValue="0")int mainCode) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mainCode", mainCode);
		
		List<Talent> subType = tService.subType(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("subType", subType);
		
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/point/market/usePoint")
	public Map<String, Object> usePoint(HttpSession session, 
			@RequestParam int mypoint, 
			@RequestParam String seller, 
			@RequestParam("rNum") int rNum) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> model = new HashMap<>();
		
		map.put("mId", info.getUserId());
		Point dto = pService.mypoint(map);
		
		if(mypoint-3000 >= 0){
			map.put("history", "이력서 열람");
			map.put("point", 3000);
			map.put("total", dto.getMypoint()-3000);
			pService.usePoint(map);
			
			map.put("rNum", rNum);
			pService.buyResume(map);
			
			map.put("history", "공개 이력서 열람");
			map.put("point", 300);
			map.put("mId", seller);
			pService.savePoint(map);
			
			// 이력서 보러가기
			model.put("state", 1);
		}else{
			// 포인트가 부족합니다.
			model.put("state", 0);
		}
		
		return model;
	}
	
	@RequestMapping(value="/point/storagy", method=RequestMethod.GET)
	public String storagy(@RequestParam(value="page", defaultValue="1")int current_page, 
			@RequestParam(value="mainCode", defaultValue="0")int mainCode, 
			@RequestParam(value="subCode", defaultValue="")String subCode, 
			HttpServletRequest req, HttpSession session, Model model) throws Exception {
		List<Talent> mainType = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		if(subCode!=null && ! subCode.equals("") ){
			List<String> subCodes = Arrays.asList(subCode);
			map.put("list", subCodes);
		}else{
			map.put("list", null);
		}
		
		mainType = tService.mainType();
		
		if(mainCode!=0)
			map.put("mainCode", mainCode);
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		map.put("mId", info.getUserId());
		
		int total_page = 0;
		int rows = 6;
		int dataCount = tService.storagyDataCount(map);
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Talent> list = tService.storagyResume(map);
		list = tService.interestList(list);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp + "/point/market";
        if(mainCode!=0) {
        	query = "mainCode=" + mainCode;
        	if(subCode!=null && ! subCode.equals("")){
        		query += "&subCode=" + subCode;
        	}
        }
        
        if(query.length()!=0) {
        	listUrl = cp + "/point/market?" + query;
        }
        
		String paging = util.paging(current_page, total_page, listUrl);
		
		model.addAttribute("page", current_page);
		model.addAttribute("mainType", mainType);
		model.addAttribute("mainCode", mainCode);
		model.addAttribute("subCode", subCode);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return ".point_layout.resume.storagy";
	}
}