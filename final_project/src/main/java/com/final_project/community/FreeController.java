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
import org.springframework.web.bind.annotation.ResponseBody;

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
		map.put("groupNum", dto.getGroupNum());
		map.put("orderNo", dto.getOrderNo());

		Free preReadDto = service.preReadFree(map);
		Free nextReadDto = service.nextReadFree(map);

		String query = "page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue" + URLEncoder.encode(searchValue, "utf-8");
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

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
	
	@RequestMapping(value = "/community/free/delete")
	public String delete(
			@RequestParam int frnum, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.deleteFree(frnum, pathname, info.getUserId());

		String query = "page=" + page;

		return "redirect:/community/free?" + query;
	}

	@RequestMapping(value = "/community/free/update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int frnum, 
			@RequestParam String page,
			Model model, 
			HttpSession session) throws Exception {

		String query = "page=" + page;

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Free dto = service.readFree(frnum);
		if (dto == null) {
			return "redirect:/commuinty/free?" + query;
		}

		if (!info.getUserId().equals(dto.getmId())) {
			return "redirect:/commuinty/free?" + query;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");

		return ".community_layout.free.created";
	}

	@RequestMapping(value = "/community/free/update", method = RequestMethod.POST)
	public String updateSubmit(
			Free dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		String query = "page=" + page;

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.updateFree(dto, pathname);

		return "redirect:/community/free?" + query;
	}
	
	@RequestMapping(value = "/community/free/deleteFile")
	public String deleteFile(
			@RequestParam int frnum, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		Free dto = service.readFree(frnum);

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";
		if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			dto.setSaveFilename(" ");
			dto.setOriginalFilename(" ");
			service.updateFree(dto, pathname);
		}
		String query = "frnum=" + frnum + "&page=" + page;
		return "redirect:/community/free/update?" + query;
	}
	
	@RequestMapping(value = "/community/free/insertLikeFree", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertLikeFree(
			Free dto, 
			@RequestParam(value = "frnum") int frnum, 
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		dto.setFrnum(frnum);
		dto.setmId(info.getUserId());
		int result = service.insertLikeFree(dto);
		if (result == 0)
			state = "false";

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value = "/community/free/countLikeFree", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countLikePhoto(
			@RequestParam(value="frnum") int frnum) throws Exception {

		String state = "true";
		int countLikeFree = service.countLikeFree(frnum);
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("countLikeFree", countLikeFree);

		return model;
	}
	
	@RequestMapping(value = "/community/free/insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdReply(
			FreeReply dto,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		dto.setmId(info.getUserId());
		int result = service.insertReply(dto);
		if (result == 0)
			state = "false";

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value = "/community/free/listReply")
	public String listReply(
			@RequestParam int frnum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("frnum", frnum);

		dataCount = service.replyDataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<FreeReply> list = service.listReply(map);

		Iterator<FreeReply> it = list.iterator();
		while (it.hasNext()) {
			FreeReply vo = it.next();
			vo.setContent(myUtil.htmlSymbols(vo.getContent()));
		}

		String paging = myUtil.paging(current_page, total_page);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);

		return "community_layout/free/listReply";
	}

	// 댓글 및 댓글별답글 삭제
	@RequestMapping(value = "/community/free/deleteReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam int replyNum,
			@RequestParam String mode,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mode", mode);
		map.put("replyNum", replyNum);
		map.put("mId", info.getUserId());


		// 댓글삭제
		int result = service.deleteReply(map);

		if (result == 0)
			state = "false";

		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	// 댓글별 답글 리스트
	@RequestMapping(value = "/community/free/listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam int answer, 
			Model model) throws Exception {

		List<FreeReply> listReplyAnswer = service.listReplyAnswer(answer);

		// 엔터를 <br>
		Iterator<FreeReply> it = listReplyAnswer.iterator();
		while (it.hasNext()) {
			FreeReply dto = it.next();
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}

		// jsp로 넘길 데이터
		model.addAttribute("listReplyAnswer", listReplyAnswer);

		return "community_layout/free/listReplyAnswer";
	}

	// 댓글별 답글 개수
	@RequestMapping(value = "/community/free/replyCountAnswer", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyCountAnswer(
			@RequestParam int answer) throws Exception {

		int count = 0;

		count = service.replyCountAnswer(answer);

		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("count", count);
		return model;
	}

}
