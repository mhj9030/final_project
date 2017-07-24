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
import com.final_project.point.PointService;

@Controller("community.photoController")
public class PhotoController {
	
	@Autowired
	private PointService pointService;
	@Autowired
	private PhotoService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	@Autowired
	private FileManager fileManager;
	
	
	@RequestMapping("/community/photo")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			Model model, HttpServletRequest req) throws Exception{
		
		String cp = req.getContextPath();

		int rows = 6;
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

		List<Photo> list = service.listPhoto(map);

		int listNum, n = 0;
		Iterator<Photo> it = list.iterator();
		while (it.hasNext()) {
			Photo data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/community/photo";
		String articleUrl = cp + "/community/photo/article?page=" + current_page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		listUrl = cp + "/community/photo?" + query;
		articleUrl = cp + "/community/photo/article?page=" + current_page + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("photo", "on");

		
		return ".community_layout.photo.list";
	}
	
	@RequestMapping(value = "/community/photo/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {

		model.addAttribute("mode", "created");

		return ".community_layout.photo.created";
	}

	@RequestMapping(value = "/community/photo/created", method = RequestMethod.POST)
	public String createdSubmit(Photo dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		dto.setmId(info.getUserId());

		service.insertPhoto(dto, pathname);

		return "redirect:/community/photo";
	}
	
	@RequestMapping(value="/community/photo/download")
	public void download(
			@RequestParam int ptnum,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"community";
		Photo dto=service.readPhoto(ptnum);
		boolean flag=false;
		
		if(dto!=null) {
			flag=fileManager.doFileDownload(
					     dto.getSaveFilename(), 
					     dto.getOriginalFilename(), pathname, resp);
			Map<String, Object> map = new HashMap<>();
			map.put("history", "사진다운로드");
			map.put("point", 1000);
			map.put("mId", dto.getmId());
			pointService.savePoint(map);
		}
		
		if(! flag) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print("<script>alert('파일 다운로드가 실패했습니다.');history.back();</script>");
		}
	}
	
	@RequestMapping("/community/photo/article")
	public String article(
			@RequestParam(value = "ptnum") int ptnum,
			@RequestParam(value = "page") String page,
			@RequestParam(value = "focus", defaultValue="0") int focus,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			Model model) throws Exception {

		searchValue = URLDecoder.decode(searchValue, "utf-8");

		service.updateHitCount(ptnum);

		Photo dto = service.readPhoto(ptnum);
		if (dto == null)
			return "redirect:/community/photo?page=" + page;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("ptnum", ptnum);

		Photo preReadDto = service.preReadPhoto(map);
		Photo nextReadDto = service.nextReadPhoto(map);

		String query = "page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue" + URLEncoder.encode(searchValue, "utf-8");
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("focus", focus);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		return ".community_layout.photo.article";
	}

	@RequestMapping(value = "/community/photo/delete")
	public String delete(
			@RequestParam int ptnum, 
			@RequestParam String page,
			@RequestParam(value = "type", defaultValue = "") String type,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		type = URLDecoder.decode(type, "UTF-8");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.deletePhoto(ptnum, pathname, info.getUserId());

		String query = "page=" + page;

		return "redirect:/community/photo?" + query;
	}

	@RequestMapping(value = "/community/photo/update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int ptnum, 
			@RequestParam String page,
			Model model, 
			HttpSession session) throws Exception {

		String query = "page=" + page;

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Photo dto = service.readPhoto(ptnum);
		if (dto == null) {
			return "redirect:/commuinty/photo?" + query;
		}

		if (!info.getUserId().equals(dto.getmId())) {
			return "redirect:/commuinty/photo?" + query;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");

		return ".community_layout.photo.created";
	}

	@RequestMapping(value = "/community/photo/update", method = RequestMethod.POST)
	public String updateSubmit(
			Photo dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		String query = "page=" + page;

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.updatePhoto(dto, pathname);

		return "redirect:/community/photo?" + query;
	}

	@RequestMapping(value = "/community/photo/deleteFile")
	public String deleteFile(
			@RequestParam int ptnum, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		Photo dto = service.readPhoto(ptnum);

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";
		if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			dto.setSaveFilename(" ");
			dto.setOriginalFilename(" ");
			service.updatePhoto(dto, pathname);
		}
		String query = "ptnum=" + ptnum + "&page=" + page;
		return "redirect:/community/photo/update?" + query;
	}

	@RequestMapping(value = "/community/photo/insertLikePhoto", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertLikePhoto(
			Photo dto, 
			@RequestParam(value = "ptnum") int ptnum, 
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		dto.setPtnum(ptnum);
		dto.setmId(info.getUserId());
		int result = service.insertLikePhoto(dto);
		if (result == 0)
			state = "false";

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value = "/community/photo/countLikePhoto", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countLikePhoto(
			@RequestParam(value="ptnum") int ptnum) throws Exception {

		String state = "true";
		int countLikePhoto = service.countLikePhoto(ptnum);
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("countLikePhoto", countLikePhoto);

		return model;
	}
	
	
	@RequestMapping(value = "/community/photo/insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdReply(
			PhotoReply dto,
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

	@RequestMapping(value = "/community/photo/listReply")
	public String listReply(
			@RequestParam int ptnum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("ptnum", ptnum);

		dataCount = service.replyDataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<PhotoReply> list = service.listReply(map);

		Iterator<PhotoReply> it = list.iterator();
		while (it.hasNext()) {
			PhotoReply vo = it.next();
			vo.setContent(myUtil.htmlSymbols(vo.getContent()));
		}

		String paging = myUtil.paging(current_page, total_page);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);

		return "community_layout/photo/listReply";
	}

	// 댓글 및 댓글별답글 삭제
	@RequestMapping(value = "/community/photo/deleteReply", method = RequestMethod.POST)
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
	@RequestMapping(value = "/community/photo/listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam int answer, 
			Model model) throws Exception {

		List<PhotoReply> listReplyAnswer = service.listReplyAnswer(answer);

		// 엔터를 <br>
		Iterator<PhotoReply> it = listReplyAnswer.iterator();
		while (it.hasNext()) {
			PhotoReply dto = it.next();
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}

		// jsp로 넘길 데이터
		model.addAttribute("listReplyAnswer", listReplyAnswer);

		return "community_layout/photo/listReplyAnswer";
	}

	// 댓글별 답글 개수
	@RequestMapping(value = "/community/photo/replyCountAnswer", method = RequestMethod.POST)
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
