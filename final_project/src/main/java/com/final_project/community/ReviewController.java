package com.final_project.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.final_project.company.SearchService;

@Controller("community.reviewController")
public class ReviewController {
	@Autowired
	private SearchService companyService;
	
	
	@RequestMapping("/community/review")
	public String list(Model model) {
		
		
		model.addAttribute("review", "on");
		return ".community_layout.review.list";
	}

}
