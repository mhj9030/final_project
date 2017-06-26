package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.newsController")
public class NewsController {
	
	@RequestMapping("/community/news")
	public String method(Model model) {
		
		model.addAttribute("news", "on");
		return ".community_layout.news.container";

	}

}
