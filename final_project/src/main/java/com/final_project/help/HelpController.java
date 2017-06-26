package com.final_project.help;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("help.helpController")
public class HelpController {
	
	@RequestMapping("/help/main")
	public String method() {
		return ".help_layout.main.container";

	}

}
