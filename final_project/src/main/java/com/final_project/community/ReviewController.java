package com.final_project.community;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;
import com.final_project.company.SearchService;

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
		
		/*Map<String, Object> map = new HashMap<>();
		
		service.listCompany(map);
		
		*/
		model.addAttribute("mode", "created");

		return ".community_layout.review.created";
	}

	

}
