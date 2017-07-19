package com.final_project.member;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.final_project.common.MyUtilBootstrap;

@Controller("member.myInquiryController")
public class MyInquiryController {
	@Autowired
	private MyInquiryService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@RequestMapping("/member/myInquiry")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="cqSubject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model, HttpServletRequest req, HttpSession session
			) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String cp = req.getContextPath();
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mId", info.getUserId());
		map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);
        
        dataCount=service.dataCount(map);
		
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount);
        
        if(total_page < current_page) 
            current_page = total_page;
        
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);
        
        List<MyInquiry> list=service.listMyInquiry(map);
        
        int listNum, n = 0;
        Iterator<MyInquiry> it=list.iterator();
        while(it.hasNext()){
        	MyInquiry data=it.next();
        	listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String query="";
        String listUrl=cp+"/member/myInquiry";
        String articleUrl = cp+"/member/myInquiry/article?page="+current_page;
        
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl=cp+"/member/myInquiry?"+query;
        	articleUrl=cp+"/member/myInquiry/article?page="+current_page+"&"+query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        model.addAttribute("myInquiry", "on");
        
		return ".member_layout.myInquiry.list";
	}
}
