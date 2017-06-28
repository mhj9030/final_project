package com.final_project.point;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("point.mypointController")
public class MyPointController {
	@RequestMapping("/point/mypoint")
	public String method() {
		return ".point_layout.mypoint.container";
	}
}