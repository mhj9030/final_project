package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.tipController")
public class TipController {
	
	@RequestMapping("/community/tip")
	public String method(Model model) {
		
		model.addAttribute("tip", "on");
		return ".community_layout.tip.container";

	}

}
