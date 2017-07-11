package com.final_project.help;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("help.eventController")
public class EventController {
	
	@RequestMapping("/help_layout/event/list")
	public String method() {
		return ".help_layout.event.list";

	}

}
