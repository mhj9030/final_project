package com.final_project.help;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("help.faqController")
public class FaqController {
	
	@RequestMapping("/help/faq")
	public String method() {
		return ".help_layout.faq.container";

	}

}



