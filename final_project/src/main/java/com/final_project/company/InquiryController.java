package com.final_project.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("company.inquiryController")
public class InquiryController {
	
	@RequestMapping("/company/inquiry/created")
	public String createdForm(Model model) {
		
		model.addAttribute("mode", "created");
		model.addAttribute("inquiry", "on");
		
		return ".company_layout.inquiry.created";
	}
}
