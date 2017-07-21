package com.final_project.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("member.scrapController")
public class ScrapController {
	
	
	@RequestMapping("/member/scrap")
	public String list(Model model) throws Exception{
		
        
		return ".member_layout.scrap.list";
	}
}
