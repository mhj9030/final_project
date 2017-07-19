package com.final_project.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;

@Controller("point.mypointController")
public class MypointController {
	@Autowired
	private PointServiceImpl service;
	
	@Autowired
	private MyUtilBootstrap util;
	
	@RequestMapping("/point/mypoint")
	public String list(@RequestParam(value="page", defaultValue="1")int current_page, 
			@RequestParam(value="startDate", defaultValue="")String startDate,
			@RequestParam(value="endDate", defaultValue="")String endDate,
			@RequestParam(value="pointType", defaultValue="")String pointType,
			HttpSession session, Model model) throws Exception {
		Point dto = new Point();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("mId", info.getUserId());
		// 나의 포인트
		dto = service.mypoint(map);
		
		map.put("startDate", startDate.replace("-", ""));
		map.put("endDate", endDate.replace("-", ""));
		map.put("pointType", pointType);
		
		int total_page = 0;
		int rows = 10;
		
		int dataCount = service.dataCount(map);

		if (dataCount != 0)
			total_page = util.pageCount(rows, dataCount);

		if (current_page > total_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;

		map.put("start", start);
		map.put("end", end);

		
		System.out.println("List");
		// 포인트 내역
		List<Point> list = service.readlist(map);
		
		// 페이징
		String paging = null;
		paging = util.paging(current_page, total_page);
		
		model.addAttribute("point", dto);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("pointType", pointType);
		
		return ".point_layout.mypoint.mypoint";
	}
	
	
	@RequestMapping("/point/saveEvent")
	public String saveEvent(HttpSession session, Model model) throws Exception {
		Point dto = new Point();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("mId", info.getUserId());
		
		// 나의 포인트
		dto = service.mypoint(map);
		
		model.addAttribute("point", dto);
		
		return ".point_layout.saveEvent.random";
	}
	
	@ResponseBody
	@RequestMapping("/point/saveEvent/randomPoint")
	public Map<String, Object> randomPoint(HttpSession session){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> model = new HashMap<>();
		
		map.put("mId", info.getUserId());
		Point dto = service.mypoint(map);
		
		if(service.isPointEvent(map)!=0){
			model.put("state", 2);
			return model;
		}
		
		int random = (int) (Math.random()*21) * 300;
		
		if(random == 0)
			random = 100;
		
		System.out.println(random);
		
		
		
		if(dto.getMypoint()-500 >= 0){
			map.put("history", "포인트 복권");
			map.put("point", 500);
			map.put("total", dto.getMypoint()-500);
			service.usePoint(map);
			
			map.put("history", "포인트 복권 당첨포인트");
			map.put("point", random);
			service.savePoint(map);
			
			model.put("point", random);
			model.put("state", 1);
		}else{
			// 포인트가 부족합니다.
			System.out.println(">>> 포인트가 부족합니다.");
			model.put("state", 0);
		}
		
		return model;
	}
}