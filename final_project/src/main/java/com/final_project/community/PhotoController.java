package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.photoController")
public class PhotoController {
	
	@RequestMapping("/community/photo")
	public String method(Model model) {
		
		model.addAttribute("photo", "on");
		return ".community_layout.photo.container";

	}

}
