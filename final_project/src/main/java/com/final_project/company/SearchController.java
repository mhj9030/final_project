package com.final_project.company;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("company.searchController")
public class SearchController {
	
	@RequestMapping("/company/search")
	public String method(Model model) {
		
		model.addAttribute("search", "on");
		
		return ".company_layout.search.container";
	}
}
