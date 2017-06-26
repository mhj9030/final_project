package com.final_project.profile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("ProfileController")
public class ProfileController {
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String method() {
		return ".profileLayout";

	}

}
