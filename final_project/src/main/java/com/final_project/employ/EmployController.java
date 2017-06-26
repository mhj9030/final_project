package com.final_project.employ;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("employ.employController")
public class EmployController {
	
	@RequestMapping("/employ/main")
	public String method() {
		return ".employ_layout.main.container";

	}

}
