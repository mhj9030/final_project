package com.final_project.main;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.final_project.community.Group;
import com.final_project.community.GroupService;
import com.final_project.community.News;
import com.final_project.community.NewsService;
import com.final_project.company.Company;
import com.final_project.employ.Employ;
import com.final_project.employ.EmployService;

@Controller("mainController")
public class MainController {
	@Autowired
	private MainService service;
	@Autowired
	private GroupService groupService;
	@Autowired
	private NewsService newsService;
	@Autowired
	private EmployService employService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest req) throws Exception{
		
		String cp = req.getContextPath();
		List<Company> comList=service.listMainCompany();
		
		String articleUrl=cp+"/company/search/article";
		
		
		List<Group> groupList = service.listMainGroup();
		Iterator<Group> it = groupList.iterator();
		while (it.hasNext()) {
			Group data = it.next();
			data.setList(groupService.tagList(data.getGroupNum()));
		}
		List<News> newsList = newsService.listMainNews();
		
		List<Employ> employList  = employService.list_applicant_rank();
		
		
		
		model.addAttribute("employList",employList);
		model.addAttribute("groupList", groupList);
		model.addAttribute("comList", comList);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("newsList", newsList);
		return ".mainLayout";
	}
	
}
