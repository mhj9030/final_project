package com.final_project.company;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("company.createdController")
public class CreatedController {
	@Autowired
	private CreatedService service;
	
	@RequestMapping(value="/company/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		
		
		model.addAttribute("created", "on");
		model.addAttribute("mode", "created");
		
		return ".company_layout.created.container";
	}
	
	@RequestMapping(value="/company/created", method=RequestMethod.POST)
	public String createdSubmit(Company dto, HttpSession session) throws Exception{
		//SessionInfo info=(SessionInfo)session.getAttribute("member");
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"company";

		//dto.setmId(info.getUserId());
		dto.setmId("phj375@naver.com");
		service.insertCompany(dto, pathname);
				
		return "redirect:/company/search";
	}
}











