package com.final_project.point;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.final_project.member.SessionInfo;

@Controller("point.pointMarketController")
public class PointMarketController {
	@Autowired
	PointService pService;
	
	@RequestMapping("/point/market")
	public String method() {
		return ".point_layout.market.container";
	}
	
	@ResponseBody
	@RequestMapping("/point/market/usePoint")
	public void usePoint(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		// 포인트 사용
		map.put("history", "이력서 열람");
		map.put("point", 3000);
		map.put("mId", info.getUserId());
		
		pService.usePoint(map);
		
		// 포인트 use나 save 사용시 유의 사항
		// 종류가 하나라면 컨트롤러에서 map을 생성해 던지고 마켓서비스에서 usePoint만 부름
		// 종류가 여러개라면 마켓서비스에 usePoint에서 map도 같이 설정해야함
		
		return ;
	}
}