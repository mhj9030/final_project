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
		System.out.println(map.get("pointType"));
		
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
}