package com.final_project.community;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import com.final_project.company.Company;
import com.final_project.company.SearchService;
import com.final_project.member.SessionInfo;

import oracle.net.aso.h;


@Controller("community.reviewController")
public class ReviewController {
	@Autowired
	private SearchService cservice;
	@Autowired
	private ReviewService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	
	
	@RequestMapping("/community/review")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			Model model, HttpServletRequest req) throws Exception {

		String cp = req.getContextPath();

		int rows = 5;
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

		List<Review> list = service.listReview(map);

		int listNum, n = 0;
		Iterator<Review> it = list.iterator();
		while (it.hasNext()) {
			Review data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}

		String query = "";
		String listUrl = cp + "/community/review";
		String articleUrl = cp + "/community/review/article?page=" + current_page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		listUrl = cp + "/community/review?" + query;
		articleUrl = cp + "/community/review/article?page=" + current_page + "&" + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
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
			@RequestParam(value="company", defaultValue="") String company
			) throws Exception {
		
		model.addAttribute("company", company);
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

		return "redirect:/community/review";
	}
	
	

}
