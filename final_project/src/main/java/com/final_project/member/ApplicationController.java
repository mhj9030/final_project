package com.final_project.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.applicationController")
public class ApplicationController {
	@Autowired
	private ApplicationService service;
	
	@RequestMapping("/member/applications/list")
	public String list(Model model) throws Exception {
		
		
		return ".member_layout.application.list";
	}
	
	@RequestMapping("/member/applications/created")
	public String created(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("mId", info.getUserId());
		
		Member mem = service.memberList(map);
		List<MemberDetail> mdac = service.academyList(map);
		List<MemberDetail> mdpr = service.projectList(map);
		List<MemberDetail> mdco = service.careerList(map);
		
		model.addAttribute("mList", mem);
		model.addAttribute("acList", mdac);
		model.addAttribute("proList", mdpr);
		model.addAttribute("coList", mdco);
		
		return ".member_layout.application.created";
	}
	
	@RequestMapping("/member/applications/application")
	public String article(Model model) throws Exception {
		
		return ".member_layout.application.application";
	}
}