package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.reviewController")
public class ReviewController {
	
	@RequestMapping("/community/review")
	public String method() {
		return ".community_layout.review.container";

	}

}
