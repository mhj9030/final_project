package com.final_project.company;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;

@Controller("company.applicantController")
public class ApplicantController {
	@Autowired
	private ApplicantService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@RequestMapping("/company/applicant")
	public String employList(Model model, HttpServletRequest req, HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String cSerial=info.getcSerial();
		
		List<Employ> listEmploy=service.applicantListEmploy(cSerial);
		
		model.addAttribute("listEmploy", listEmploy);
		model.addAttribute("applicant", "on");
		
		return ".company_layout.applicant.list";
	}
	
	@RequestMapping("/company/applicant/list")
	@ResponseBody
	public String list(
			@RequestParam(value="ceNum", defaultValue="") int ceNum,
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="order", defaultValue="recent") String order,
			Model model, HttpServletRequest req) throws Exception {
		
		String cp = req.getContextPath();
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		dataCount=service.dataCount(ceNum);
		
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page) 
			current_page = total_page;
		
		Map<String, Object> map=new HashMap<String, Object>();
		int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);
		
        List<Applicant> list=service.listApplicant(map);
        
        String listUrl=cp+"/company/applicant";
        
        String paging=myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		
		model.addAttribute("applicant", "on");
		
		return null;
	}
	
	
}









