package com.final_project.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.applicationController")
public class ApplicationController {
	@Autowired
	private ApplicationService service;
	
	@RequestMapping("/member/applications/list")
	public String applyList(Model model) throws Exception {
		
		return ".member_layout.application.list";
	}
	
	@RequestMapping("/member/applications/created")
	public String application(Model model) throws Exception {
		
		return ".member_layout.application.application";
	}
}