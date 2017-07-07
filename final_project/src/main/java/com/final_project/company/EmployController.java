package com.final_project.company;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.final_project.member.SessionInfo;

@Controller("company.employController")
public class EmployController {
	@Autowired
	private EmployService service;
	
	@RequestMapping("/company/employ")
	public String list(Model model) {
		
		model.addAttribute("employ", "on");
		
		return ".company_layout.employ.list";
	}
	
	@RequestMapping(value="/company/employ/created", method=RequestMethod.GET)
	public String createdForm(Model model, HttpSession session) throws Exception{
		
		model.addAttribute("employHead", "on");
		model.addAttribute("mode", "created");
		
		return ".company_layout.employ.created";
	}
	
	@RequestMapping(value="/company/employ/created", method=RequestMethod.POST)
	public String createdSubmit(Employ dto, HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"employ";
		
		dto.setcSerial(info.getcSerial());
		service.insertComEmploy(dto, pathname);
		
		return "redirect:/company/employ";
	}
}











