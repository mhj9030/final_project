package com.final_project.community;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
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
import com.final_project.point.PointService;

@Controller("community.recommendController")
public class RecommendController {
	@Autowired
	private MyUtilBootstrap myUtil;
	@Autowired
	private RecommendService service;
	@Autowired
	private PointService pointService;
	
	
	
	@RequestMapping("/community/recommend")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model,
			HttpServletRequest req) throws Exception {
		
		String cp = req.getContextPath();

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchValue", searchValue);

		int total_goodCom = service.dataCountGoodcom_total();
		dataCount = service.dataCountCompany(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Recommend> list = service.listRecommend(map);

		String query = "";
		if (searchValue.length() != 0) {
			query += "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		String listUrl = cp + "/community/recommend?"+query;
		String articleUrl = cp + "/community/recommend/article?page=" + current_page + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		
		model.addAttribute("total_goodCom", total_goodCom);
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("recommend", "on");
		
		
		return ".community_layout.recommend.list";
	}
	
	@RequestMapping("/community/recommend/article")
	public String article(
			@RequestParam(value = "cNum") int cNum,
			@RequestParam(value = "page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		
		int dataCount = 0;


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cNum", cNum);

		dataCount = service.dataCountGoodcom(map);



		List<RecommendArticle> list = service.listRecommendArticle(map);
		RecommendArticle dto = service.RecommendArticleInfo(cNum);
		int employCount = service.dataCountEmploy(cNum);


		
		model.addAttribute("employCount", employCount);
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		return ".community_layout.recommend.article";
	}
	
	@RequestMapping(value="/community/recommend/moreInfo", method=RequestMethod.POST)
	public String moreInfo(
			@RequestParam(value="gcNum") int gcNum,
			Model model
			) throws Exception{
		
		RecommendArticle dto = service.readRecommendContent(gcNum);
		
		model.addAttribute("dto", dto);
		
		return "community_layout/recommend/article_article";
	}
	
	@RequestMapping(value="/community/recommend/created", method=RequestMethod.GET)
	public String createdForm(
			@RequestParam(value="cNum") int cNum,
			@RequestParam(value="page", defaultValue="1") int page,
			Model model
			) throws Exception{
		
		RecommendArticle dto = service.RecommendArticleInfo(cNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("mode", "created");
		return ".community_layout.recommend.created";
	}
	
	@RequestMapping(value="/community/recommend/created", method=RequestMethod.POST)
	public String createdSubmit(
			RecommendArticle dto,
			HttpSession session,
			@RequestParam(value="cNum") int cNum,
			@RequestParam(value="page", defaultValue="1") int page,
			Model model
			) throws Exception{
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		
		dto.setmId(info.getUserId());
		
		Map<String, Object> map = new HashMap<>();
		map.put("history", "기업후기작성");
		map.put("point", 1000);
		map.put("mId", dto.getmId());
		pointService.savePoint(map);
		service.insertRecommend(dto);
		
		model.addAttribute("cNum", cNum);
		model.addAttribute("page", page);
		return "redirect:/community/recommend/article?cNum="+cNum;
	}
	
	@RequestMapping(value = "/community/recommend/update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int gcNum, 
			Model model, 
			HttpSession session) throws Exception {


		SessionInfo info = (SessionInfo) session.getAttribute("member");

		RecommendArticle vo = service.readRecommendContent(gcNum);
		if (vo == null) {
			return "redirect:/commuinty/recommend/article?gcNum=" + gcNum;
		}

		if (!info.getUserId().equals(vo.getmId())) {
			return "redirect:/commuinty/recommend/article?gcNum=" + gcNum;
		}

		model.addAttribute("vo", vo);
		model.addAttribute("mode", "update");

		return ".community_layout.recommend.created";
	}

	@RequestMapping(value = "/community/recommend/update", method = RequestMethod.POST)
	public String updateSubmit(
			RecommendArticle vo,
			@RequestParam(value = "gcNum") int gcNum,
			@RequestParam(value = "cNum") int cNum,
			HttpSession session) throws Exception {


		service.updateRecommend(vo);

		return "redirect:/community/recommend/article?cNum="+cNum;
	}
	
	@RequestMapping(value = "/community/recommend/delete")
	public String delete(
			@RequestParam int gcNum,
			@RequestParam int cNum) throws Exception {

		service.deleteRecommend(gcNum);

		return "redirect:/community/recommend/article?cNum=" + cNum;
	}


}
