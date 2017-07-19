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

import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;

@Controller("community.groupController")
public class GroupController {
	@Autowired
	private GroupService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	
	
	@RequestMapping("/community/group")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "groupName") String searchKey,
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

		if(searchKey.equals("groupTag")){
			dataCount = service.dataTagCount(map);
		}else{
			dataCount = service.dataCount(map);
		}
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Group> list = null;
		
		if(searchKey.equals("groupTag")){
			list = service.tagListGroup(map);
		}else{
			list = service.listGroup(map);
		}

		
		Iterator<Group> it = list.iterator();
		while (it.hasNext()) {
			Group data = it.next();
			data.setList(service.tagList(data.getGroupNum()));
		}
		
		
		List<GroupTag> menuTag = service.menuTag();
		String query = "";
		String listUrl = cp + "/community/group";
		String articleUrl = cp + "/community/group/article?page=" + current_page;
		if (searchValue.length() != 0) {
			query += "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		listUrl = cp + "/community/group?" + query;
		articleUrl = cp + "/community/group/article?page=" + current_page + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("menuTag", menuTag);
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("group", "on");

		return ".community_layout.group.list";
	}
	
	@RequestMapping("/community/group/mylist")
	public String myList(
			Model model,
			HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<>();
		map.put("mId", info.getUserId());
		
		List<Group> list = service.myList(map);
		
		Iterator<Group> it = list.iterator();
		while (it.hasNext()) {
			Group data = it.next();
			data.setList(service.tagList(data.getGroupNum()));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("group", "on");
		return ".community_layout.group.mylist";

	}
	
	@RequestMapping(value="/community/group/createdLimit")
	@ResponseBody
	public Map<String, Object> createdLimit(
			@RequestParam(value = "mId") String mId, 
			HttpSession session) throws Exception{
		
		String state="true";
		Map<String, Object> map = new HashMap<>();
		map.put("mId", mId);
		
		int result = service.createdLimit(map);
		
		if(result>=3){
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/community/group/groupNameCheck")
	@ResponseBody
	public Map<String, Object> groupNameCheck(
			@RequestParam(value = "groupName") String groupName) throws Exception{
		
		String state = "true";
		Map<String, Object> map = new HashMap<>();
		map.put("groupName", groupName);
		
		int result = service.groupNameCheck(map);
		
		if(result==1){
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/community/group/created", method=RequestMethod.GET)
	public String createdForm(Model model) {
		
		model.addAttribute("group", "on");
		model.addAttribute("mode", "created");
		return ".community_layout.group.created";
	}
	
	@RequestMapping(value = "/community/group/created", method = RequestMethod.POST)
	public String createdSubmit(Group dto, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		dto.setmId(info.getUserId());
		
		int result = service.insertGroup(dto, pathname);
		if(result<1){
			return "redirect:/community/group";
		}
		
		int maxNum = service.readGroupNum();
		
		for(int i=0; i<dto.getGroupTag().length; i++){
			dto.setTag(dto.getGroupTag()[i]);
			map.put("tag", dto.getTag());
			map.put("groupNum", maxNum);
			map.put("mId", dto.getmId());
			service.insertTag(map);
			service.insertMember(map);
		}

		return "redirect:/community/group";
	}
	
	@RequestMapping("/community/group/article")
	public String article(
			@RequestParam(value = "groupNum") int groupNum,
			@RequestParam(value = "page", defaultValue="1") int page,
			HttpServletRequest req,
			Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("groupNum", groupNum);
		
		Group dto = service.readGroup(map);
		dto.setList(service.tagList(dto.getGroupNum()));

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		return ".community_layout.group.article";
	}
}
