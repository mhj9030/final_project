package com.final_project.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.final_project.common.MyUtilBootstrap;

@Controller("member.scrapController")
public class ScrapController {
	@Autowired
	private ScrapService service;
	
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@RequestMapping("/member/scrap")
	public String scrap(
			@RequestParam(value="page", defaultValue="1") int current_page,
			Model model, HttpServletRequest req, HttpSession session) throws Exception{
		
		return ".member_layout.scrap.list";
	}
	
	@RequestMapping("/member/list")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session) throws Exception{
SessionInfo info =(SessionInfo) session.getAttribute("member");
        
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mId", "han@naver.com");
		
		Map<String, Object> model = new HashMap<>();
		List<Scrap> list = service.listScrap(map);
		model.put("list",list);
		
		
		return model;
	}
}
