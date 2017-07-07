package com.final_project.help;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("help.surveyController")
public class SurveyController {
	
	@RequestMapping("/help/survey")
	public String method() {
		return ".help_layout.survey.container";

	}

}
