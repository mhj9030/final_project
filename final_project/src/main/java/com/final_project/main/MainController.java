package com.final_project.main;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.final_project.community.Group;
import com.final_project.community.GroupService;
import com.final_project.community.News;
import com.final_project.community.NewsService;
import com.final_project.company.Company;
import com.final_project.employ.Employ;
import com.final_project.employ.EmployService;
import com.final_project.help.Notice;
import com.final_project.help.NoticeService;

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
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model, HttpServletRequest req) throws Exception{
		
		String cp = req.getContextPath();
		List<Company> comList=service.listMainCompany();
		
		String articleUrl=cp+"/company/search/article";
		String articleUrl1 = cp+"/notice/article?page=" + current_page;
		
		
		
		List<Group> groupList = service.listMainGroup();
		Iterator<Group> it = groupList.iterator();
		while (it.hasNext()) {
			Group data = it.next();
			data.setList(groupService.tagList(data.getGroupNum()));
		}
		List<News> newsList = newsService.listMainNews();
		
		List<Employ> employList  = employService.list_applicant_rank();
		
		
		
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Notice> noticeList = noticeService.listNotice(map);
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int dataCount = 0;
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		 int start = (current_page - 1) * rows + 1;
	     int end = current_page * rows;
	     map.put("start", start);
	     map.put("end", end);

	        // 글 리스트
	        List<Notice> list = service.listNotice(map);

	        // 리스트의 번호
	        int listNum, n = 0;
	        Iterator<Notice> it1=list.iterator();
	        while(it1.hasNext()) {
	        	Notice data = it1.next();
	            listNum = dataCount - (start + n - 1);
	            data.setListNum(listNum);
	            n++;
	        }
		
	    model.addAttribute("list", list);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("employList",employList);
		model.addAttribute("groupList", groupList);
		model.addAttribute("comList", comList);
		model.addAttribute("articleUrl1", articleUrl1);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("newsList", newsList);
		return ".mainLayout";
	}
	
}
