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

@Controller("company.inquiryController")
public class InquiryController {
	@Autowired
	private InquiryService service;
	@Autowired
	private CreatedService createdSerivce;
	@Autowired
	private MyUtilBootstrap myUtil;
	
	@RequestMapping("/company/inquiry/created")
	public String createdForm(
			@RequestParam int cNum, @RequestParam String cName, 
			@RequestParam(value="page", defaultValue="1") int page,
			Model model) throws Exception {
		
		model.addAttribute("cNum", cNum);
		model.addAttribute("cName", cName);
		model.addAttribute("page", page);
		model.addAttribute("mode", "created");
		model.addAttribute("inquiry", "on");
		
		return ".company_layout.inquiry.created";
	}
	
	@RequestMapping(value="/company/inquiry/createdSubmit", method=RequestMethod.POST)
	public String createdSubmit(
			@RequestParam int cNum, 
			@RequestParam(value="page", defaultValue="1") int page,
			Inquiry dto, HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		dto.setmId(info.getUserId());
		service.insertInquiry(dto);
				
		return "redirect:/company/search/article?page="+page+"&cNum="+cNum;
	}
	
	@RequestMapping("/company/inquiry")
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
		
		Company dto=createdSerivce.readCompanySerial(info.getcSerial());
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cNum", dto.getcNum());
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
		
        List<Inquiry> list=service.listInquiry(map);
        
        int listNum, n = 0;
        Iterator<Inquiry> it=list.iterator();
        while(it.hasNext()){
        	Inquiry data=it.next();
        	listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        String query="";
        String listUrl=cp+"/company/inquiry";
        String articleUrl = cp+"/company/inquiry/article?page="+current_page;
        
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl=cp+"/company/inquiry?"+query;
        	articleUrl=cp+"/company/inquiry/article?page="+current_page+"&"+query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        model.addAttribute("inquiry", "on");
        
		return ".company_layout.inquiry.list";
	}
	
	@RequestMapping("/company/inquiry/article")
	public String article(
			@RequestParam(value="cqNum") int cqNum,
			@RequestParam(value="page", defaultValue="1") String page,
			@RequestParam(value="searchKey", defaultValue="cqSubject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception{
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		Inquiry dto=service.readInquiry(cqNum);
		
		dto.setCqContent(myUtil.htmlSymbols(dto.getCqContent()));
		
		Map<String, Object> map=new HashMap<>();
		
		map.put("cNum", dto.getcNum());
		map.put("cqNum", cqNum);
		map.put("cqGroupNum", dto.getCqGroupNum());
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		Inquiry preReadDto=service.preReadInquiry(map);
		Inquiry nextReadDto=service.nextReadInquiry(map);
		
		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
		}
		
		model.addAttribute("cqNum", cqNum);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("inquiry", "on");
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		return ".company_layout.inquiry.article";
	}
	
	@RequestMapping("/company/inquiry/answer")
	public String answerForm(@RequestParam(value="cqNum") int cqNum, Model model) throws Exception{
		
		Inquiry dto=service.readInquiry(cqNum);
		
		model.addAttribute("cqNum", cqNum);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "answer");
		model.addAttribute("inquiry", "on");
		
		return ".company_layout.inquiry.created";
	}
	
	@RequestMapping(value="/company/inquiry/answerSubmit", method=RequestMethod.POST)
	public String answerSubmit(@RequestParam(value="cqNum") int cqNum, Inquiry dto, HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Company comDto=createdSerivce.readCompanySerial(info.getcSerial());
		
		dto.setmId(info.getUserId());
		dto.setcNum(comDto.getcNum());
		
		service.insertAnswerInquiry(dto);
		service.updateAnswerInquiry(cqNum);
		
		return "redirect:/company/inquiry";
	}
}














