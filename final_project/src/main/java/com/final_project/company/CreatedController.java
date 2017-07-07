package com.final_project.company;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.final_project.member.SessionInfo;

@Controller("company.createdController")
public class CreatedController {
	@Autowired
	private CreatedService service;
	
	@RequestMapping(value="/company/created", method=RequestMethod.GET)
	public String createdForm(Model model, HttpSession session) throws Exception{
		
		model.addAttribute("created", "on");
		model.addAttribute("mode", "created");
		
		return ".company_layout.created.created";
	}
	
	@RequestMapping(value="/company/created", method=RequestMethod.POST)
	public String createdSubmit(Company dto, HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"company";

		dto.setmId(info.getUserId());
		service.insertCompany(dto, pathname);
				
		return "redirect:/company/search";
	}
	
	@RequestMapping(value="/company/update", method=RequestMethod.GET)
	public String updateForm(Model model, HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Company dto=service.readCompanyId(info.getUserId());
		
		if(dto==null){
			return "redirect:/company/search";
		}
		
		if(!info.getUserId().equals(dto.getmId())){
			return "redirect:/company/search";
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("created", "on");
		
		return ".company_layout.created.created";
	}
	
	@RequestMapping(value="/company/update", method=RequestMethod.POST)
	public String updateSubmit(Company dto, HttpSession session) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"company";
		
		service.updateCompany(dto, pathname);
		
		return "redirect:/company/search";
	}
}











