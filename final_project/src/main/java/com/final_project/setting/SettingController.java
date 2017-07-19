package com.final_project.setting;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.final_project.member.SessionInfo;
import com.final_project.profile.Profile;
import com.final_project.profile.ProfileService;

@Controller
public class SettingController {

	@Autowired
	private SettingService service;

	@Autowired
	private ProfileService pservice;

	// 경력 추가
	@RequestMapping(value = "/setting/career", method = RequestMethod.POST)
	public String careerSubmit(Career dto, Model model, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Profile pdto = pservice.profileRead(info.getUserId());

		System.out.println(dto.getCompany());

		dto.setMid(info.getUserId());
		int result = service.insertCareer(dto);

		if (result == 1) {
			model.addAttribute("mode", "completed");
			model.addAttribute("dto", pdto);
		} else {
			model.addAttribute("mode", "fail");
			model.addAttribute("dto", pdto);
		}

		return ".profile.setting";
	}

	// 학교 추가
	@RequestMapping(value = "/setting/ability", method = RequestMethod.POST)
	public String userAbility(Ability dto, Model model, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Profile pdto = pservice.profileRead(info.getUserId());

		dto.setMid(info.getUserId());
		int result = service.insertAbility(dto);

		if (result == 1) {
			model.addAttribute("mode", "completed");
			model.addAttribute("dto", pdto);

		} else {
			model.addAttribute("mode", "fail");
			model.addAttribute("dto", pdto);
		}
		return ".profile.setting";
	}

	// 전문 분야
	@RequestMapping(value = "/setting/expertise", method = RequestMethod.POST)
	public String userExpertise(Expertise dto, Model model, HttpSession session) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Profile pdto = pservice.profileRead(info.getUserId());

		if (pdto.getEid() != null && pdto.getExpertise() == null) {
			dto.setEid(info.getUserId());
			int result = service.updateExpertise(dto);

			if (result == 1) {
				model.addAttribute("mode", "completed");
			} else {
				model.addAttribute("mode", "fail");
			}

		} else if (pdto.getExpertise() == null) {
			dto.setEid(info.getUserId());
			int result = service.insertExpertise(dto);
			if (result == 1) {
				model.addAttribute("mode", "completed");
			} else {
				model.addAttribute("mode", "fail");
			}

		} else {

			dto.setEid(info.getUserId());
			int result = service.updateExpertise(dto);
			if (result == 1) {
				model.addAttribute("mode", "completed");
			} else {
				model.addAttribute("mode", "fail");
			}
		}
		pdto = pservice.profileRead(info.getUserId());
		model.addAttribute("dto", pdto);
		return ".profile.setting";
	}

	
	// 프로젝트 추가
	@RequestMapping(value = "/setting/project", method = RequestMethod.POST)
	public String projectSubmit(Project dto, Model model, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Profile pdto = pservice.profileRead(info.getUserId());

		int result = service.insertProject(dto);
		if (result == 1) {
			model.addAttribute("mode", "completed");
			model.addAttribute("dto", pdto);
		} else {
			model.addAttribute("mode", "fail");
			model.addAttribute("dto", pdto);
		}

		return ".profile.setting";
	}

}
