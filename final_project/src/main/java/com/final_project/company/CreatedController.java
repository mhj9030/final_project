package com.final_project.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("company.createdController")
public class CreatedController {
	
	@RequestMapping("/company/created")
	public String method(Model model) {
		
		model.addAttribute("created", "on");
		
		return ".company_layout.created.container";
	}
}
