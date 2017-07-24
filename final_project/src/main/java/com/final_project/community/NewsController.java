package com.final_project.community;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.final_project.common.FileManager;
import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;

@Controller("community.newsController")
public class NewsController {

	@Autowired
	private NewsService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	@Autowired
	private FileManager fileManager;

	@RequestMapping("/community/news")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			@RequestParam(value = "type", defaultValue = "") String type, Model model, HttpServletRequest req)
			throws Exception {

		String cp = req.getContextPath();

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
			type = URLDecoder.decode(type, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("type", type);

		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<News> list = service.listNews(map);

		int listNum, n = 0;
		Iterator<News> it = list.iterator();
		while (it.hasNext()) {
			News data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "type=" + URLEncoder.encode(type, "utf-8");
		String listUrl = cp + "/community/news";
		String articleUrl = cp + "/community/news/article?page=" + current_page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		listUrl = cp + "/community/news?" + query;
		articleUrl = cp + "/community/news/article?page=" + current_page + "&" + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("type", type);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("news", "on");

		return ".community_layout.news.list";
	}

	@RequestMapping(value = "/community/news/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {

		model.addAttribute("mode", "created");

		return ".community_layout.news.created";
	}

	@RequestMapping(value = "/community/news/created", method = RequestMethod.POST)
	public String createdSubmit(News dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		dto.setmId(info.getUserId());

		service.insertNews(dto, pathname);

		return "redirect:/community/news";
	}

	@RequestMapping("/community/news/article")
	public String article(@RequestParam(value = "jbnum") int jbnum, @RequestParam(value = "page", defaultValue="1") String page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			@RequestParam(value = "type", defaultValue = "") String type, Model model) throws Exception {

		searchValue = URLDecoder.decode(searchValue, "utf-8");
		type = URLDecoder.decode(type, "utf-8");

		service.updateHitCount(jbnum);

		News dto = service.readNews(jbnum);
		if (dto == null)
			return "redirect:/community/news?type=" + URLEncoder.encode(type, "utf-8") + "&page=" + page;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("jbnum", jbnum);
		map.put("type", type);

		News preReadDto = service.preReadNews(map);
		News nextReadDto = service.nextReadNews(map);

		String query = "type=" + URLEncoder.encode(type, "utf-8") + "&page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue" + URLEncoder.encode(searchValue, "utf-8");
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("type", type);

		return ".community_layout.news.article";
	}

	@RequestMapping(value = "/community/news/delete")
	public String delete(@RequestParam int jbnum, @RequestParam String page,
			@RequestParam(value = "type", defaultValue = "") String type, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		type = URLDecoder.decode(type, "UTF-8");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.deleteNews(jbnum, pathname, info.getUserId());

		String query = "page=" + page + "&type=" + URLEncoder.encode(type, "utf-8");

		return "redirect:/community/news?" + query;
	}

	@RequestMapping(value = "/community/news/update", method = RequestMethod.GET)
	public String updateForm(@RequestParam int jbnum, @RequestParam String page, Model model, HttpSession session)
			throws Exception {

		String query = "page=" + page;

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		News dto = service.readNews(jbnum);
		if (dto == null) {
			return "redirect:/commuinty/news?" + query;
		}

		if (!info.getUserId().equals(dto.getmId())) {
			return "redirect:/commuinty/news?" + query;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");

		return ".community_layout.news.created";
	}

	@RequestMapping(value = "/community/news/update", method = RequestMethod.POST)
	public String updateSubmit(News dto, @RequestParam String page, HttpSession session) throws Exception {

		String query = "page=" + page;

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.updateNews(dto, pathname);

		return "redirect:/community/news?" + query;
	}

	@RequestMapping(value = "/community/news/deleteFile")
	public String deleteFile(@RequestParam int jbnum, @RequestParam String page, HttpSession session) throws Exception {

		News dto = service.readNews(jbnum);

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";
		if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			dto.setSaveFilename(" ");
			dto.setOriginalFilename(" ");
			service.updateNews(dto, pathname);
		}
		String query = "jbnum=" + jbnum + "&page=" + page;
		return "redirect:/community/news/update?" + query;
	}

	@RequestMapping(value = "/community/news/insertLikeNews", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertLikeNews(News dto, @RequestParam(value = "jbnum") int jbnum, HttpSession session)
			throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		dto.setJbnum(jbnum);
		dto.setmId(info.getUserId());
		int result = service.insertLikeNews(dto);
		if (result == 0)
			state = "false";

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value = "/community/news/countLikeNews", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countLikeNews(@RequestParam(value = "jbnum") int jbnum) throws Exception {

		String state = "true";
		int countLikeNews = service.countLikeNews(jbnum);
		System.out.println(countLikeNews);
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("countLikeNews", countLikeNews);

		return model;
	}

	@RequestMapping(value = "/community/news/insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdReply(NewsReply dto,
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

	@RequestMapping(value = "/community/news/listReply")
	public String listReply(
			@RequestParam int jbnum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("jbnum", jbnum);

		dataCount = service.replyDataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<NewsReply> list = service.listReply(map);

		Iterator<NewsReply> it = list.iterator();
		while (it.hasNext()) {
			NewsReply vo = it.next();
			vo.setContent(myUtil.htmlSymbols(vo.getContent()));
		}

		String paging = myUtil.paging(current_page, total_page);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);

		return "community_layout/news/listReply";
	}

	// 댓글 및 댓글별답글 삭제
	@RequestMapping(value = "/community/news/deleteReply", method = RequestMethod.POST)
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

		// 좋아요/싫어요 는 ON DELETE CASCADE 로 자동 삭제

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
	@RequestMapping(value = "/community/news/listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam int answer, 
			Model model) throws Exception {

		List<NewsReply> listReplyAnswer = service.listReplyAnswer(answer);

		// 엔터를 <br>
		Iterator<NewsReply> it = listReplyAnswer.iterator();
		while (it.hasNext()) {
			NewsReply dto = it.next();
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}

		// jsp로 넘길 데이터
		model.addAttribute("listReplyAnswer", listReplyAnswer);

		return "community_layout/news/listReplyAnswer";
	}

	// 댓글별 답글 개수
	@RequestMapping(value = "/community/news/replyCountAnswer", method = RequestMethod.POST)
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
