package com.final_project.company;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("company.companyController")
public class CompanyController {
	
	@RequestMapping("/company/main")
	public String method() {
		return ".company_layout.main.container";

	}

}
