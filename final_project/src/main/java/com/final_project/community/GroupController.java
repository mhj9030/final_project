package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("community.groupController")
public class GroupController {
	
	@RequestMapping("/community/group")
	public String method(Model model) {
		
		model.addAttribute("group", "on");
		return ".community_layout.group.container";

	}

}
