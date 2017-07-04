package com.final_project.company;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.final_project.common.MyUtilBootstrap;

@Controller("company.searchController")
public class SearchController {
	@Autowired
	private SearchService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@RequestMapping("/company/search")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="cName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="order", defaultValue="recent") String order,
			Model model,
			HttpServletRequest req) throws Exception {
		
		String cp = req.getContextPath();
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("searchKey", searchKey);
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
        map.put("order", order);
        
        List<Company> list=service.listCompany(map);
        
        String query="";
        String listUrl=cp+"/company/search";
        String articleUrl=cp+"/company/search/article?page="+current_page;
        
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
		
        if(query.length()!=0) {
        	listUrl = cp+"/company/search?" + query;
        	articleUrl = cp+"/company/search/article?page=" + current_page + "&"+ query;
        }
        
        String paging=myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("order", order);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		model.addAttribute("search", "on");
		
		return ".company_layout.search.container";
	}
	
	@RequestMapping("/company/search/article")
	public String article(
			@RequestParam(value="cNum") int cNum,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="cName") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception{
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		Company dto=service.readCompany(cNum);
		
		dto.setcIntro(myUtil.htmlSymbols(dto.getcIntro()));
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query += "&searchKey=" + searchKey + 
		                    "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("search", "on");
		
		return ".company_layout.search.article";
	}
}
