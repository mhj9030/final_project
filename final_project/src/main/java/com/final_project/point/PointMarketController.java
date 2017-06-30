package com.final_project.point;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("point.pointMarketController")
public class PointMarketController {
	@RequestMapping("/point/market")
	public String method() {
		return ".point_layout.market.container";
	}
}