package com.final_project.member;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.final_project.talent.Talent;
import com.final_project.talent.TalentService;

@Controller("member.applicationController")
public class ApplicationController {
	@Autowired
	private ApplicationService service;
	
	@Autowired
	private TalentService tService;
	
	// 글리스트
	@RequestMapping("/member/applications/list")
	public String list(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("mId", info.getUserId());
		
		int count = 0;
		count = service.listCount(map);
		List<MemberDetail> list = service.list(map);
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		
		return ".member_layout.application.list";
	}
	
	// 글쓰기
	@RequestMapping(value="/member/applications/created1", method=RequestMethod.GET)
	public String created_step1(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("mId", info.getUserId());
		
		Member mem = service.memberList(map);
		List<MemberDetail> mdac = service.academyList(map);
		List<MemberDetail> mdpr = service.projectList(map);
		List<MemberDetail> mdco = service.careerList(map);
		
		List<Talent> mainType = new ArrayList<>();
		mainType = tService.mainType();
		
		model.addAttribute("mDto", mem);
		model.addAttribute("acList", mdac);
		model.addAttribute("proList", mdpr);
		model.addAttribute("coList", mdco);
		model.addAttribute("mainType", mainType);
		
		return ".member_layout.application.created1";
	}
	
	@RequestMapping(value="/member/applications/created2", method=RequestMethod.GET)
	public String created_step2(@RequestParam("rNum")int rNum, Model model) throws Exception {
		
		return ".member_layout.application.created2";
	}
	
	@RequestMapping(value="/member/applications/created3", method=RequestMethod.GET)
	public String created_step3(@RequestParam("rNum")int rNum, Model model) throws Exception {
		
		return ".member_layout.application.created3";
	}
	
	// 글쓰기 처리
	@RequestMapping(value="/member/applications/created1", method=RequestMethod.POST)
	public String created_step1_ok(MemberDetail dto, HttpSession session, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "resume";
		dto.setmId(info.getUserId());
		
		int rNum = service.insertOneDetails(dto, pathname);
		map.put("mId", rNum);
		List<MemberDetail> test = null;
		service.insertOneCareer(test, map);
		service.insertOneProject(test, map);
		
		model.addAttribute("rNum", rNum);
		
		return "redirect:/member/applications/created2";
	}
	
	@RequestMapping(value="/member/applications/created2", method=RequestMethod.POST)
	public String created_step2_ok(@RequestParam("rNum")int rNum, Model model) throws Exception {
		
		return "redirect:/member/applications/created3";
	}
	
	@RequestMapping(value="/member/applications/created3", method=RequestMethod.POST)
	public String created_step3_ok(@RequestParam("rNum")int rNum, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rNum", rNum);
		
		service.insertThrIntro(map);
		
		return "redirect:/member/applications/application";
	}
	
	// 글보기
	@RequestMapping("/member/applications/application")
	public String article(@RequestParam int rNum, HttpSession session, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		map.put("mId", info.getUserId());
		map.put("rNum", rNum);
		
		Member mDto = service.memberList(map);
		MemberDetail rDto = service.readResume(map);
		List<MemberDetail> acList = service.academyList(map);
		List<MemberDetail> proList = service.projectList(map);
		List<MemberDetail> coList = service.careerList(map);
		
		MemberDetail iDto = service.selectThrIntro(map);
		
		System.out.println(rDto.getApply());
		
		model.addAttribute("rNum", rNum);
		model.addAttribute("mDto", mDto);
		model.addAttribute("rDto", rDto);
		model.addAttribute("acList", acList);
		model.addAttribute("proList", proList);
		model.addAttribute("coList", coList);
		
		model.addAttribute("iDto", iDto);
		
		return ".member_layout.application.application";
	}
	
	// 삭제
	@RequestMapping("/member/applications/delete")
	public String delete(String[] rNum, HttpSession session, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		List<String> list = Arrays.asList(rNum);
		map.put("list", list);
		service.delete(list);
		
		return "redirect:/member/applications/list";
	}
	
	// 수정
	@RequestMapping(value="/member/applications/update1", method=RequestMethod.GET)
	public String update_step1(@RequestParam("rNum")int rNum, HttpSession session, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		map.put("mId", info.getUserId());
		map.put("rNum", rNum);
		
		Member mDto = service.memberList(map);
		MemberDetail rDto = service.readResume(map);
		List<MemberDetail> acList = service.academyList(map);
		List<MemberDetail> proList = service.projectList(map);
		List<MemberDetail> coList = service.careerList(map);
		
		System.out.println(rDto.getApply());
		
		List<Talent> mainType = new ArrayList<>();
		mainType = tService.mainType();
		
		model.addAttribute("rNum", rNum);
		model.addAttribute("mDto", mDto);
		model.addAttribute("rDto", rDto);
		model.addAttribute("acList", acList);
		model.addAttribute("proList", proList);
		model.addAttribute("coList", coList);
		model.addAttribute("mainType", mainType);
		model.addAttribute("mode", "update");
		
		return ".member_layout.application.created1";
	}
	
	@RequestMapping(value="/member/applications/update2", method=RequestMethod.GET)
	public String update_step2(@RequestParam("rNum")int rNum, HttpSession session, Model model) throws Exception {
		
		model.addAttribute("rNum", rNum);
		model.addAttribute("mode", "update");
		
		return ".member_layout.application.created2";
	}
	
	@RequestMapping(value="/member/applications/update3", method=RequestMethod.GET)
	public String update_step3(@RequestParam("rNum")int rNum, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rNum", rNum);
		
		MemberDetail iDto = service.selectThrIntro(map);
		
		model.addAttribute("rNum", rNum);
		model.addAttribute("iDto", iDto);
		model.addAttribute("mode", "update");
		
		return ".member_layout.application.created3";
	}
	
	// 수정 처리
	@RequestMapping(value="/member/applications/update1", method=RequestMethod.POST)
	public String update_step1_ok(@RequestParam("rNum")int rNum, MemberDetail dto, HttpSession session, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "resume";
		dto.setmId(info.getUserId());
		
		service.updateDefault(dto, pathname);
		
		model.addAttribute("rNum", rNum);
		
		return "redirect:/member/applications/application?rNum=" + rNum;
	}
	
	@RequestMapping(value="/member/applications/update2", method=RequestMethod.POST)
	public String update_step2_ok(@RequestParam("rNum")int rNum, HttpSession session, Model model) throws Exception {
		
		return "redirect:/member/applications/application?rNum=" + rNum;
	}
	
	@RequestMapping(value="/member/applications/update3", method=RequestMethod.POST)
	public String update_step3_ok(@RequestParam("rNum")String rNum, MemberDetail dto) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("rNum", rNum);
		map.put("intro1", dto.getIntro1());
		map.put("intro2", dto.getIntro2());
		map.put("intro3", dto.getIntro3());
		map.put("intro4", dto.getIntro4());
		
		service.updateThrIntro(map);
		
		return "redirect:/member/applications/application?rNum=" + rNum;
	}
}