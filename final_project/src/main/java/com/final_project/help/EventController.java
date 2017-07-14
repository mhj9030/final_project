package com.final_project.help;
import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;



@Controller("help.eventController")
public class EventController {
	@Autowired
	private EventService service;
	
	@Autowired
	private MyUtilBootstrap util;
	
	
	
	@RequestMapping("/help_layout/event/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req
			) throws Exception {
		
   	    String cp = req.getContextPath();
   	    
   	 int rows = 6;
		int total_page;
		int dataCount;

		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
     // 전체 페이지 수
     Map<String, Object> map = new HashMap<String, Object>();
     map.put("searchKey", searchKey);
     map.put("searchValue", searchValue);

		dataCount = service.dataCount(map);
		total_page = util.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;

		map.put("start", start);
		map.put("end", end);

		List<Event> list = service.listEvent(map);

		// 글번호 만들기
		int listNum, n = 0;
		Iterator<Event> it = list.iterator();
		while (it.hasNext()) {
			Event data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

     String query = "";
     String listUrl = cp+"/help_layout/event/list";
     String articleUrl = cp+"/event/article?page=" + current_page;
     if(searchValue.length()!=0) {
     	query = "searchKey=" +searchKey + 
     	             "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
     }
     
     if(query.length()!=0) {
     	listUrl = cp+"/help_layout/event/list?" + query;
     	articleUrl = cp+"/event/article?page=" + current_page + "&"+ query;
     }
		
     String paging = util.paging(current_page, total_page, listUrl);
     		
		/*model.addAttribute("subMenu", "3");*/
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
   	    
   	    
   	    
   	    
		return ".help_layout.event.list";
	}

	
	@RequestMapping(value="/help_layout/event/created", method=RequestMethod.GET)
	public String createdForm(
			Model model,
			HttpSession session) throws Exception{
		
		SessionInfo info=
				(SessionInfo)session.getAttribute("member");
		/*if(info==null) {
			return "redirect:/member/login";
		}*/

		//model.addAttribute("subMenu", "3");
		
		model.addAttribute("mode", "created");
		return ".help_layout.event.created";
	}
	
	@RequestMapping(value="/help_layout/event/created",
			method=RequestMethod.POST)
	public String createdSubmit(
			Event dto,
			Model model,
			HttpSession session) throws Exception {
		String root=session.getServletContext().getRealPath("/");
		String path=root+File.separator+"uploads"+File.separator+"event";
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		/*if(info==null) {
			return "redirect:/member/login";
		}*/
		
		dto.setmId(info.getUserId());
		service.insertEvent(dto, path);
		
		return "redirect:/help_layout/event/list";
	}
	

	
	
	
}
