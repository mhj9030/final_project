package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.recommendController")
public class RecommendController {
	
	@RequestMapping("/community/recommend")
	public String list(Model model) {
		
		model.addAttribute("recommend", "on");
		return ".community_layout.recommend.list";

	}

}
