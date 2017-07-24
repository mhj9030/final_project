package com.final_project.profile;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.final_project.common.FileManager;
import com.final_project.member.SessionInfo;

@Controller
public class ProfileController {

	@Autowired
	private ProfileService service;
	@Autowired
	public FileManager fileManager;

	@RequestMapping(value = "/profile")
	public String method(@RequestParam(value = "id") String id, Model model, HttpSession session) throws Exception {

		Profile dto = service.profileRead(id);

		model.addAttribute("dto", dto);

		return ".profileLayout";
	}

	@RequestMapping(value = "/profile/pwd", method = RequestMethod.GET)
	public String profileSettingpwd(String userdrop, Model model, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		if (info == null) {
			return "redirect:/submain";
		}

		if (userdrop == null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "userdrop");
		}

		return ".profile.settingpwd";
	}

	// 패스워드 submit
	@RequestMapping(value = "/profile/pwd", method = RequestMethod.POST)
	public String profileSettingpwdSubmit(@RequestParam(value = "userpassword") String userpassword, String mode,
			Model model, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		if (info == null) {
			return "redirect:/submain";
		}

		Profile dto = service.profileRead(info.getUserId());
		if (dto == null) {
			session.invalidate();
			return "redirect:/";
		}

		// 패스워드 암호화 하여 맞는지 검사
		ShaPasswordEncoder pe = new ShaPasswordEncoder(256);
		userpassword = pe.encodePassword(userpassword, null);

		if (dto.getMpwd().equals(userpassword)) {
			if (mode.equals("update")) {
				model.addAttribute("dto", dto);
				model.addAttribute("mode", "update");

				return ".profile.setting";
			}
		}

		model.addAttribute("message", "패스워드가 일치하지 않습니다.");

		return ".profile.settingpwd";
	}

	@RequestMapping(value = "/profile/setting")
	public String settingProfile() {

		return ".profile.settingProfile";
	}

	@RequestMapping(value="/profile/update")
	public String updateForm(@RequestParam(value = "id") String id, Model model) throws Exception{

		Profile dto = service.profileRead(id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("profile", "on");
		
		return ".profile_layout.created";
	}
	
	@RequestMapping(value="/profile/update", method=RequestMethod.POST)
	public String updateSubmit(
			Profile dto,
			HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"profile";
		
		service.updateProfile(dto, pathname);
		
		return "redirect:/profile/?id="+info.getUserId();
	}
	
	@RequestMapping(value="/profile/deleteFile", method=RequestMethod.GET)
	public String deleteFile(
			@RequestParam String id,
			HttpSession session
			) throws Exception{
		
		Profile dto=service.profileRead(id);
		if(dto==null){
			return "redirect:/profile/id="+id;
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "profile";	
		
		if(dto.getProPhoto()!=null && dto.getProPhoto().length()!=0){
			fileManager.doFileDelete(dto.getProPhoto(), pathname);
			
			dto.setProPhoto("");
			//service.updateBoard(dto, pathname);
		}
		
		return "redirect:/profile/update?id="+id;
	}
}









