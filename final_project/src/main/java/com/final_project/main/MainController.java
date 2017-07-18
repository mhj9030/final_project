package com.final_project.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.final_project.company.Company;

@Controller("mainController")
public class MainController {
	@Autowired
	private MainService service;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest req) throws Exception{
		
		String cp = req.getContextPath();
		List<Company> comList=service.listMainCompany();
		
		String articleUrl=cp+"/company/search/article";
		
		model.addAttribute("comList", comList);
		model.addAttribute("articleUrl", articleUrl);
		
		return ".mainLayout";
	}
}
