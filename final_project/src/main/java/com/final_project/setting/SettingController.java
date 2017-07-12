package com.final_project.setting;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.final_project.member.SessionInfo;

@Controller
public class SettingController {

	@Autowired
	private SettingService service;


	@RequestMapping(value = "/setting/career", method = RequestMethod.POST)
	public String careerSubmit(Setting dto, Model model, HttpSession session) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		System.out.println(dto.getCompany());
		
		
		dto.setMid(info.getUserId());
		int result = service.insertCareer(dto);

		if (result == 1) {
			model.addAttribute("mode", "completed");
		} else {
			model.addAttribute("mode", "fail");
		}
		
		return ".profile.setting";


	}

}
