package com.final_project.talent;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("talent.talentController")
public class TalentController {
	
	@RequestMapping("/talent/main")
	public String method() {
		return ".talent_layout.main.container";

	}

}
