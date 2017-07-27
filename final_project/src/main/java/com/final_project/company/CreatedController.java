package com.final_project.company;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
				
		session.removeAttribute("member");
		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping(value="/company/update", method=RequestMethod.GET)
	public String updateForm(Model model, HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Company dto=service.readCompanySerial(info.getcSerial());
		
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
	
	@RequestMapping(value="/company/serialCheck")
	@ResponseBody
	public Map<String, Object> serialCheck(
			@RequestParam String cSerial
			) throws Exception{
		
		String passed="false";
		Company dto=service.readCompanySerial(cSerial);
		
		if(dto==null)
			passed="true";
		
		Map<String, Object> model = new HashMap<>(); 
		
		model.put("passed", passed);
		
		return model;
	}
}











