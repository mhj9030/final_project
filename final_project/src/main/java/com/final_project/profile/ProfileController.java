package com.final_project.profile;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProfileController {

	@Autowired
	private ProfileService service;

	@RequestMapping(value = "/profile")
	public String method(@RequestParam(value = "mid") String mid, Model model, HttpSession session) throws Exception {

		Profile dto = service.profileRead(mid);

		model.addAttribute("dto", dto);

		return ".profileLayout";
	}

}
