package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.freeController")
public class FreeController {
	
	@RequestMapping("/community/free")
	public String method(Model model) {
		
		model.addAttribute("free", "on");
		return ".community_layout.free.container";

	}

}
