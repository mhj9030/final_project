package com.final_project.community;

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

import com.final_project.common.MyUtilBootstrap;
import com.final_project.company.Company;
import com.final_project.company.SearchService;
import com.final_project.member.SessionInfo;
import com.final_project.point.PointService;



@Controller("community.reviewController")
public class ReviewController {
	@Autowired
	private SearchService cservice;
	@Autowired
	private ReviewService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	@Autowired
	private PointService pointService;
	
	
	@RequestMapping("/community/review")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			@RequestParam(value = "type", defaultValue = "최신순") String type,
			Model model, HttpServletRequest req) throws Exception {

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
		

		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Review> list = null;
		
		if(type.equals("추천순")){
			list = service.listReviewLike(map);
		}else{
			list = service.listReview(map);
		}


		int listNum, n = 0;
		Iterator<Review> it = list.iterator();
		while (it.hasNext()) {
			Review data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "type="+type;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		String listUrl = cp + "/community/review?"+query;
		String articleUrl = cp + "/community/review/article?page=" + current_page + "&" + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("type", type	);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("review", "on");

		return ".community_layout.review.list";
	}
	
	@RequestMapping(value = "/community/review/created", method = RequestMethod.GET)
	public String createdForm(
			Model model, HttpServletRequest req, 
			@RequestParam(value="directcompany", defaultValue="") String directcompany,
			@RequestParam(value="cNum", defaultValue="0") int cNum
			) throws Exception {
		
		if(cNum!=0){
			String cName = cservice.searchCompanyName(cNum);
			model.addAttribute("directcompany", cName);
		}
		
		if(directcompany.length()!=0)
			model.addAttribute("directcompany", directcompany);

		
		model.addAttribute("cNum", cNum);
		model.addAttribute("mode", "created");

		return ".community_layout.review.created";
	}
	
	@RequestMapping(value = "/community/review/companyList")
	public String listCompany(
			Model model,
			@RequestParam(value="searchCompany", defaultValue="") String searchCompany
			) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchCompany", searchCompany);
		
		List<Company> list = cservice.listCompanyName(map);
		
		
		model.addAttribute("list", list);

		return "community_layout/review/companyList";
	}
	
	@RequestMapping(value = "/community/review/created", method = RequestMethod.POST)
	public String createdSubmit(
			Review dto, 
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		dto.setmId(info.getUserId());
		
		
		service.insertReview(dto);
		Map<String, Object> map = new HashMap<>();
		map.put("history", "후기작성");
		map.put("point", 1000);
		map.put("mId", dto.getmId());
		pointService.savePoint(map);

		return "redirect:/community/review";
	}
	
	@RequestMapping("/community/review/article")
	public String article(
			@RequestParam(value = "ibnum") int ibnum,
			@RequestParam(value = "page") String page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			@RequestParam(value = "type", defaultValue = "") String type,
			Model model) throws Exception {

		searchValue = URLDecoder.decode(searchValue, "utf-8");
		type = URLDecoder.decode(type, "utf-8");

		service.updateHitCount(ibnum);

		Review dto = service.readReview(ibnum);
		if (dto == null)
			return "redirect:/community/photo?page=" + page;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("ibnum", ibnum);

		Review preReadDto = service.preReadReview(map);
		Review nextReadDto = service.nextReadReview(map);

		String query = "page=" + page + "&type=" + URLEncoder.encode(type, "utf-8");
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue" + URLEncoder.encode(searchValue, "utf-8");
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		return ".community_layout.review.article";
	}
	
	@RequestMapping(value = "/community/review/delete")
	public String delete(
			@RequestParam int ibnum, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		service.deleteReview(ibnum);

		String query = "page=" + page;

		return "redirect:/community/review?" + query;
	}

	@RequestMapping(value = "/community/review/update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int ibnum, 
			@RequestParam String page,
			Model model, 
			HttpSession session) throws Exception {

		String query = "page=" + page;

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Review dto = service.readReview(ibnum);
		if (dto == null) {
			return "redirect:/commuinty/review?" + query;
		}

		if (!info.getUserId().equals(dto.getmId())) {
			return "redirect:/commuinty/review?" + query;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");

		return ".community_layout.review.created";
	}

	@RequestMapping(value = "/community/review/update", method = RequestMethod.POST)
	public String updateSubmit(
			Review dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		String query = "page=" + page;
		service.updateReview(dto);

		return "redirect:/community/review?" + query;
	}
	
	
	@RequestMapping(value = "/community/review/insertLikeReview", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertLikeReview(
			Review dto, 
			@RequestParam(value = "ibnum") int ibnum, 
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		dto.setIbnum(ibnum);
		dto.setmId(info.getUserId());
		int result = service.insertLikeReview(dto);
		if (result == 0)
			state = "false";

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value = "/community/review/countLikeReview", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countLikeReview(
			@RequestParam(value="ibnum") int ibnum) throws Exception {

		String state = "true";
		int countLikeReview = service.countLikeReview(ibnum);
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("countLikeReview", countLikeReview);

		return model;
	}
	
	
	@RequestMapping(value = "/community/review/insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdReply(
			ReviewReply dto,
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

	@RequestMapping(value = "/community/review/listReply")
	public String listReply(
			@RequestParam int ibnum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("ibnum", ibnum);

		dataCount = service.replyDataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<ReviewReply> list = service.listReply(map);

		Iterator<ReviewReply> it = list.iterator();
		while (it.hasNext()) {
			ReviewReply vo = it.next();
			vo.setContent(myUtil.htmlSymbols(vo.getContent()));
		}

		String paging = myUtil.paging(current_page, total_page);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);

		return "community_layout/review/listReply";
	}

	// 댓글 및 댓글별답글 삭제
	@RequestMapping(value = "/community/review/deleteReply", method = RequestMethod.POST)
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
	@RequestMapping(value = "/community/review/listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam int answer, 
			Model model) throws Exception {

		List<ReviewReply> listReplyAnswer = service.listReplyAnswer(answer);

		// 엔터를 <br>
		Iterator<ReviewReply> it = listReplyAnswer.iterator();
		while (it.hasNext()) {
			ReviewReply dto = it.next();
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}

		// jsp로 넘길 데이터
		model.addAttribute("listReplyAnswer", listReplyAnswer);

		return "community_layout/review/listReplyAnswer";
	}

	// 댓글별 답글 개수
	@RequestMapping(value = "/community/review/replyCountAnswer", method = RequestMethod.POST)
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
