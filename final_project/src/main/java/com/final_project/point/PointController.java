package com.final_project.point;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("point.pointController")
public class PointController {
	
	@RequestMapping("/point/main")
	public String method() {
		return ".point_layout.main.container";
	}
}