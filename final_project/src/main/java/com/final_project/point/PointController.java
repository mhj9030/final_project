package com.final_project.point;

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

import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;


@Controller("point.pointController")
public class PointController {
	@Autowired
	private PointService service;
	
	@Autowired
	private MyUtilBootstrap util;
	
	@RequestMapping("/point/main")
	public String list(@RequestParam(value="page", defaultValue="0")int current_page, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		int rows = 10;
		int total_page = 0;
		
		int dataCount = service.dataCount();
		
		if(dataCount != 0)
			total_page = util.pageCount(rows, dataCount);
		
		if(current_page < total_page){
			current_page = total_page;
		}
		
		int start = (current_page-1)*rows+1;
		int end = total_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Point> list;
		list = service.readBoardList(map);
		
		String paging = util.paging(current_page, total_page);
		
		model.addAttribute("page", current_page);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return ".point_layout.main.list";
	}
	
	@RequestMapping(value="/point/main/created", method=RequestMethod.GET)
	public String createdForm(Model model) {
		model.addAttribute("mode", "created");
		
		return ".point_layout.main.created";
	}
	
	@RequestMapping(value="/point/main/created", method=RequestMethod.POST)
	public String createdSubmit(HttpSession session, Point dto) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		dto.setmId(info.getUserId());
		
		service.insertBoard(dto);
		
		return "redirect:/point/main";
	}
	
	@RequestMapping(value="/point/main/article", method=RequestMethod.GET)
	public String article(@RequestParam("num")int num, @RequestParam("page")int page, Model model) {
		Point dto;
		Map<String, Object> map = new HashMap<>();

		map.put("poNum", num);
		dto = service.readBoard(map);
		Point preReadDto = service.preRead(map);
		Point nextReadDto = service.nextRead(map);
		
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		return ".point_layout.main.article";
	}
	
	@RequestMapping(value="/point/main/update", method=RequestMethod.GET)
	public String updateForm(@RequestParam("num")int num, @RequestParam("page")int page, Model model) {
		Point dto;
		Map<String, Object> map = new HashMap<>();

		map.put("poNum", num);
		dto = service.readBoard(map);
		
		model.addAttribute("num", num);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		
		return ".point_layout.main.created";
	}
	
	@RequestMapping(value="/point/main/update", method=RequestMethod.POST)
	public String updateSubmit(@RequestParam("num")int num, @RequestParam("page")int page, Point dto, Model model) {
		System.out.println("updateSubmit");
		
		int result = service.updateBoard(dto);
		
		if(result==1)
			System.out.println("성공");
		else
			System.out.println("실패");
		
		model.addAttribute("num", num);
		model.addAttribute("page", page);
		
		return "redirect:/point/main/article";
	}
	
	@RequestMapping(value="/point/main/delete", method=RequestMethod.GET)
	public String delete(@RequestParam(value="num")int num) {
		Map<String, Object> map = new HashMap<>();
		map.put("poNum", num);
		
		service.deleteBoard(map);
		
		return "redirect:/point/main";
	}
}