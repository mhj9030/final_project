package com.final_project.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("communityController")
public class CommunityController {
	
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String method() {
		return ".communityLayout";

	}

}
