package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.reviewController")
public class ReviewController {
	
	@RequestMapping("/community/review")
	public String list(Model model) {
		
		model.addAttribute("review", "on");
		return ".community_layout.review.list";
	}

}
