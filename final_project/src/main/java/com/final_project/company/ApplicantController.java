package com.final_project.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("company.applicantController")
public class ApplicantController {
	
	@RequestMapping("/company/applicant")
	public String method(Model model) {
		
		model.addAttribute("applicant", "on");
		
		return ".company_layout.applicant.list";
	}
}
