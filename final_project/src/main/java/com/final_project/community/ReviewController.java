package com.final_project.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.final_project.company.Company;
import com.final_project.company.SearchService;

import oracle.net.aso.h;


@Controller("community.reviewController")
public class ReviewController {
	@Autowired
	private SearchService service;
	
	
	@RequestMapping("/community/review")
	public String list(Model model) {
		
		
		model.addAttribute("review", "on");
		return ".community_layout.review.list";
	}
	
	@RequestMapping(value = "/community/review/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		
		List<Company> list = service.listCompanyName(); 
		
		
		
		model.addAttribute("mode", "created");

		return ".community_layout.review.created";
	}
	
	@RequestMapping(value = "/community/review/companyList")
	public String listCompany(
			Model model,
			@RequestParam(value="searchCompany", defaultValue="") String searchCompany
			) throws Exception {
		List<Company> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchCompany", searchCompany);
		
		
		
		model.addAttribute("list", list);

		return "community_layout/review/companyList";
	}
	
	

}
