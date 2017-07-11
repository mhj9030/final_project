package com.final_project.company;

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

@Controller("company.employController")
public class EmployController {
	@Autowired
	private EmployService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@RequestMapping("/company/employ")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model, HttpServletRequest req, HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String cp = req.getContextPath();
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("cSerial", info.getcSerial());
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		
		if(dataCount!=0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page) 
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);
		
        List<Employ> list=service.listComEmploy(map);
        
        int listNum, n=0;
        Iterator<Employ> it=list.iterator();
        
        while(it.hasNext()){
        	Employ data=it.next();
        	listNum=dataCount-(start+n-1);
        	data.setListNum(listNum);
        	n++;
        }
        
        String query="";
        String listUrl=cp+"/company/employ";
        String articleUrl=cp+"/company/employ/article?page="+current_page;
        
        if(searchValue.length()!=0){
        	query="searchValue="+URLEncoder.encode(searchValue, "utf-8");
        }
        
        if(query.length()!=0){
        	listUrl = cp+"/company/employ?" + query;
        	articleUrl = cp+"/company/employ/article?page=" + current_page + "&"+ query;
        }
        
        String paging=myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		model.addAttribute("employ", "on");
		
		return ".company_layout.employ.list";
	}
	
	@RequestMapping(value="/company/employ/created", method=RequestMethod.GET)
	public String createdForm(Model model, HttpSession session) throws Exception{
		
		model.addAttribute("employ", "on");
		model.addAttribute("mode", "created");
		
		return ".company_layout.employ.created";
	}
	
	@RequestMapping(value="/company/employ/created", method=RequestMethod.POST)
	public String createdSubmit(Employ dto, HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"employ";
		
		dto.setcSerial(info.getcSerial());
		service.insertComEmploy(dto, pathname);
		
		return "redirect:/company/employ";
	}
	
	@RequestMapping("/company/employ/article")
	public String article(
			@RequestParam(value="ceNum") int ceNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception{
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");

		Employ dto=service.readEmploy(ceNum);
		
		dto.setCePrefere(myUtil.htmlSymbols(dto.getCePrefere()));
		dto.setCeEtc(myUtil.htmlSymbols(dto.getCeEtc()));
		
		String query="page="+page;
		
		if(searchValue.length()!=0){
			query+="&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("search", "on");
		
		return ".company_layout.employ.article";
	}
}











