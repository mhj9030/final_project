package com.final_project.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("company.gover_newsController")
public class Gover_newsController {
	
	@RequestMapping("/company/gover_news")
	public String method(Model model) {
		
		model.addAttribute("gover_news", "on");
		
		return ".company_layout.gover_news.list";
	}
}
