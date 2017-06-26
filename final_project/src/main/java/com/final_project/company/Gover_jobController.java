package com.final_project.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("company.gover_jobController")
public class Gover_jobController {
	
	@RequestMapping("/company/gover_job")
	public String method(Model model) {
		
		model.addAttribute("gover_job", "on");
		
		return ".company_layout.gover_job.container";
	}
}
