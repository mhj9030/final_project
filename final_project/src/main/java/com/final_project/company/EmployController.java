package com.final_project.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("company.employController")
public class EmployController {
	
	@RequestMapping("/company/employ")
	public String method(Model model) {
		
		model.addAttribute("employ", "on");
		
		return ".company_layout.employ.container";
	}
}
