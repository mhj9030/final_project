package com.final_project.community;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.final_project.common.FileManager;
import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;

@Controller("community.freeController")
public class FreeController {

	@Autowired
	private FreeService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	@Autowired
	private FileManager fileManager;

	@RequestMapping("/community/free")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			Model model, HttpServletRequest req) throws Exception{
		
		String cp = req.getContextPath();

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);

		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<Free> list = service.listFree(map);

		int listNum, n = 0;
		Iterator<Free> it = list.iterator();
		while (it.hasNext()) {
			Free data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/community/free";
		String articleUrl = cp + "/community/free/article?page=" + current_page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		listUrl = cp + "/community/free?" + query;
		articleUrl = cp + "/community/free/article?page=" + current_page + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("free", "on");
		
		return ".community_layout.free.list";
	}
	
	@RequestMapping(value = "/community/free/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {

		model.addAttribute("mode", "created");
		

		return ".community_layout.free.created";
	}

	@RequestMapping(value = "/community/free/created", method = RequestMethod.POST)
	public String createdSubmit(Free dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		dto.setmId(info.getUserId());
		dto.setMode("created");
		service.insertFree(dto, pathname);

		return "redirect:/community/free";
	}
	
	@RequestMapping(value="/community/free/download")
	public void download(
			@RequestParam int frnum,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"community";
		Free dto=service.readFree(frnum);
		boolean flag=false;
		
		if(dto!=null) {
			flag=fileManager.doFileDownload(
					     dto.getSaveFilename(), 
					     dto.getOriginalFilename(), pathname, resp);
		}
		
		if(! flag) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print("<script>alert('파일 다운로드가 실패했습니다.');history.back();</script>");
		}
	}
	
	@RequestMapping("/community/free/article")
	public String article(
			@RequestParam(value = "frnum") int frnum,
			@RequestParam(value = "page") String page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			Model model) throws Exception {

		searchValue = URLDecoder.decode(searchValue, "utf-8");

		service.updateHitCount(frnum);

		Free dto = service.readFree(frnum);
		if (dto == null)
			return "redirect:/community/free?page=" + page;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("frnum", frnum);

		//Free preReadDto = service.preReadFree(map);
		//Free nextReadDto = service.nextReadFree(map);

		String query = "page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue" + URLEncoder.encode(searchValue, "utf-8");
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		//model.addAttribute("preReadDto", preReadDto);
		//model.addAttribute("nextReadDto", nextReadDto);

		return ".community_layout.free.article";
	}
	
	@RequestMapping(value="/community/free/follow", method=RequestMethod.GET)
	public String followForm(
			@RequestParam int frnum,
			@RequestParam String page,
			Model model,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		if (info == null) {
			return "redirect:/submain";
		}
		
		Free dto = service.readFree(frnum);
		if (dto == null) {
			return "redirect:/community/free?page="+page;
		}

		String str = "["+dto.getSubject()+"] 에 대한 답변입니다.\n";
		dto.setContent(str);

		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "follow");

		return ".community_layout.free.created";
	}

	@RequestMapping(value="/community/free/follow", method = RequestMethod.POST)
	public String followSubmit(
			Free dto,
		    @RequestParam String page,
		    HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");

		if (info == null) {
			return "redirect:/community/free";
		}
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"community";

		dto.setMode("follow");
		dto.setmId(info.getUserId());
		service.insertFree(dto, pathname);

		return "redirect:/community/free?page="+page;
	}
}
