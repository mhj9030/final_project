package com.final_project.point;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("point.storagyController")
public class StoragyController {
	@RequestMapping("/point/storagy")
	public String method() {
		return ".point_layout.storagy.container";
	}
}
