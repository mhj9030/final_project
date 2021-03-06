package com.final_project.company;

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

@Controller("company.goverNewsController")
public class GoverNewsController {
	@Autowired
	private GoverNewsService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@RequestMapping("/company/gover_news")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="gnSubject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model, HttpServletRequest req) throws Exception {
		
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
        
        List<GoverNews> list=service.listGoverNews(map);
		
        int listNum, n=0;
        Iterator<GoverNews> it=list.iterator();
        
        while(it.hasNext()){
        	GoverNews data=it.next();
        	listNum=dataCount-(start+n-1);
        	data.setListNum(listNum);
        	n++;
        }
        
        String query="";
        String listUrl=cp+"/company/gover_news";
        String articleUrl=cp+"/company/gover_news/article?page="+current_page;
        
        if(searchValue.length()!=0){
        	query="searchValue="+URLEncoder.encode(searchValue, "utf-8");
        }
        
        if(query.length()!=0){
        	listUrl = cp+"/company/gover_news?" + query;
        	articleUrl = cp+"/company/gover_news/article?page=" + current_page + "&"+ query;
        }
        
        String paging=myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		model.addAttribute("gover_news", "on");
		
		return ".company_layout.gover_news.list";
	}
	
	@RequestMapping(value="/company/gover_news/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception{
		
		model.addAttribute("gover_news", "on");
		model.addAttribute("mode", "created");
		
		return ".company_layout.gover_news.created";
	}
	
	@RequestMapping(value="/company/gover_news/created", method=RequestMethod.POST)
	public String createdSubmit(GoverNews dto, Model model, HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setmId(info.getUserId());
		service.insertGoverNews(dto);
		
		return "redirect:/company/gover_news";
	}
	
	@RequestMapping(value="/company/gover_news/article")
	public String article(
			@RequestParam(value="gnNum") int gnNum,
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="searchKey", defaultValue="gnSubject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception{
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		service.updateGnHitCount(gnNum);
		
		GoverNews dto=service.readGoverNews(gnNum);
		
		dto.setGnContent(myUtil.htmlSymbols(dto.getGnContent()));
		
		Map<String, Object> map=new HashMap<>();
		
		map.put("gnNum", gnNum);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		GoverNews preReadDto=service.preReadGoverNews(map);
		GoverNews nextReadDto=service.nextReadGoverNews(map);
		
		String query="page="+page;
		
		if(searchValue.length()!=0){
			query+="&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("gover_news", "on");
		
		return ".company_layout.gover_news.article";
	}
	
	@RequestMapping(value="/company/gover_news/update")
	public String updateForm(
		@RequestParam int gnNum,
		@RequestParam(value="page", defaultValue="1") int page,
		Model model) throws Exception{
			
		GoverNews dto=service.readGoverNews(gnNum);
		
		if(dto==null)
			return "redirect:/company/gover_news";
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");
		model.addAttribute("gover_news", "on");
		
		return ".company_layout.gover_news.created"; 
	}
	
	@RequestMapping(value="/company/gover_news/update", method=RequestMethod.POST)
	public String updateSubmit(
			GoverNews dto,
			@RequestParam(value="page", defaultValue="1") int page
			) throws Exception{
		
		service.updateGoverNews(dto);
		
		return "redirect:/company/gover_news?page="+page;
	}
	
	@RequestMapping(value="/company/gover_news/delete")
	public String delete(
			@RequestParam int gnNum,
			@RequestParam(value="page", defaultValue="1") int page 
			) throws Exception{
		
		service.deleteGoverNews(gnNum);
		
		return "redirect:/company/gover_news?page="+page;
	}
}














