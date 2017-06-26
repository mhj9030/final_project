package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("community.reviewController")
public class ReviewController {
	
	@RequestMapping("/community/review")
	public String method(Model model) {
		
		model.addAttribute("review", "on");
		return ".community_layout.review.container";
	}

}
