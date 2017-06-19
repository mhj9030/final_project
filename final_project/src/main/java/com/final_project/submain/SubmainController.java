package com.final_project.submain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("SubmainController")
public class SubmainController {
	
	@RequestMapping(value = "/submain", method = RequestMethod.GET)
	public String method() {
		return ".subLayout";

	}

}
