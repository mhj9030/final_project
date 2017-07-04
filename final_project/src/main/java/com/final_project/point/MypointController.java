package com.final_project.point;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.final_project.common.MyUtil;

@Controller("point.mypointController")
public class MypointController {
	private PointServiceImpl service = new PointServiceImpl();
	private MyUtil util;
	
	@RequestMapping("/point/mypoint")
	public String method(HttpSession session, Model model) throws Exception {
		Point point = new Point();
		Map<String, Object> map = new HashMap<>();
		
		map.put("mId", /*session.getId()*/"asd@daum.net");
		point.setMypoint(0);
		point.setReserve(0);
		point.setTerminate(0);
		// 나의 포인트
		/*point = service.mypoint(map);
		
		int current_page = 0;
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

		// 포인트 내역
		List<Point> list = service.readlist(map);*/
		
		// 페이징
		String paging = null;
		//paging = util.paging(current_page, total_page);
		
		model.addAttribute("point", point);
		//model.addAttribute("list", list);
		//model.addAttribute("paging", paging);
		
		return ".point_layout.mypoint.container";
	}
}