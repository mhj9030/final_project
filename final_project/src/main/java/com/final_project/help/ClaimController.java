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

@Controller("help.claimController")
public class ClaimController {
	@Autowired
	private ClaimService service;
	
	@Autowired
	private MyUtilBootstrap util;
	
	@RequestMapping("/help_layout/claim/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req
			) throws Exception {
		
   	    String cp = req.getContextPath();
   	    
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = util.pageCount(rows, dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);

        // 글 리스트
        List<Claim> list = service.listClaim(map);

        // 리스트의 번호
        int listNum, n = 0;
        Iterator<Claim> it=list.iterator();
        while(it.hasNext()) {
        	Claim data = it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            System.out.println(listNum);
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/help_layout/claim/list";
        String articleUrl = cp+"/claim/article?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/help_layout/claim/list?" + query;
        	articleUrl = cp+"/claim/article?page=" + current_page + "&"+ query;
        }
        
        String paging = util.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);		
		
		return ".help_layout.claim.list";
	}

	
	@RequestMapping(value="/help_layout/claim/created", method=RequestMethod.GET)
	public String createdForm(
			Model model,
			HttpSession session
			) throws Exception {

		model.addAttribute("mode", "created");

		return ".help_layout.claim.created";
	}
	
	@RequestMapping(value="/help_layout/claim/created", method=RequestMethod.POST)
	public String createdSubmit(
			Claim dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setmId(info.getUserId());
		
		//dto.setmId("admin@a.com");
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"";
		
		service.insertClaim(dto, pathname);
		return "redirect:/help_layout/claim/list";
		
	}
	
	@RequestMapping(value="/claim/article")
	public String article(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");

		// 조회수 증가
		/*service.updateHitCount(num);*/

		// 해당 레코드 가져 오기
		Claim dto = service.readClaim(num);
		if(dto==null)
			return "redirect:/claim/list?page="+page;
		
        /*dto.setContent(util.htmlSymbols(dto.getContent()));*/
        
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("num", num);

		/*Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);*/
        
		// 게시물 공감 개수
		/*int countLikeBoard=service.countLikeQa(num);*/
		
		String query = "page="+page;
		if(searchValue.length()!=0) {
			query += "&searchKey=" + searchKey + 
		                    "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		model.addAttribute("dto", dto);
		/*model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);*/

		model.addAttribute("page", page);
		model.addAttribute("query", query);

		/*model.addAttribute("countLikeQa", countLikeQa);*/
		
		return ".help_layout.claim.article";
	}
	

	
	
}
