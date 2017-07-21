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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.final_project.common.FileManager;
import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;

@Controller("community.groupController")
public class GroupController {
	@Autowired
	private GroupService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	@Autowired
	private FileManager fileManager;
	
	
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
			@RequestParam(value = "page", defaultValue="1") int current_page,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			HttpServletRequest req, HttpSession session, 
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("groupNum", groupNum);
		map.put("mId", info.getUserId());
		
		int check = service.checkGroupMember(map);
		Group dto = service.readGroup(map);
		dto.setList(service.tagList(dto.getGroupNum()));
		
		dataCount = service.dataCountBoard(map);
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<GroupBoard> list = service.listGroupBoard(map);
		

		int listNum, n = 0;
		Iterator<GroupBoard> it = list.iterator();
		while (it.hasNext()) {
			GroupBoard data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/community/group/article?groupNum="+groupNum;
		String articleUrl = cp + "/community/group/boardArticle?groupNum="+groupNum+"&page=" + current_page;
		if (searchValue.length() != 0) {
			query += "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}

		listUrl = cp + "/community/group/article?groupNum="+groupNum + "&" + query;
		articleUrl = cp + "/community/group/boardArticle?groupNum="+groupNum + "&page=" + current_page + query;

		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("check", check);
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("group", "on");
		model.addAttribute("dto", dto);
		return ".community_layout.group.article";
	}
	
	@RequestMapping(value = "/community/group/deleteFile")
	public String deleteFile(
			@RequestParam int groupNum, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("groupNum", groupNum);
		Group dto = service.readGroup(map);

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";
		if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			dto.setSaveFilename("");
			dto.setOriginalFilename("");
			service.updateGroup(dto, pathname);
		}
		String query = "groupNum=" + groupNum + "&page=" + page;
		return "redirect:/community/group/article?" + query;
	}

	
	
	@RequestMapping(value="/community/group/update", method=RequestMethod.POST)
	public String groupUpdateSubmit(
			Group dto,
			HttpSession session,
			Model model) throws Exception {
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";
		
		service.updateGroup(dto, pathname);


		return "redirect:/community/group/article?groupNum="+dto.getGroupNum()+"&page=1";
	}
	
	@RequestMapping(value="/community/group/boardCreated", method=RequestMethod.GET)
	public String boardCreated(
			@RequestParam(value = "groupNum") int groupNum,
			@RequestParam(value = "page", defaultValue="1") int page,
			Model model) throws Exception {

		model.addAttribute("page", page);
		model.addAttribute("groupNum", groupNum);
		return ".community_layout.group.boardCreated";
	}
	
	
	@RequestMapping(value = "/community/group/delete")
	public String delete(
			@RequestParam int groupNum, 
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.deleteGroup(groupNum, pathname, info.getUserId());


		return "redirect:/community/group";
	}
	
	@RequestMapping(value="/community/group/boardCreated", method=RequestMethod.POST)
	public String boardCreatedSubmit(
			@RequestParam(value = "page", defaultValue="1") int page,
			GroupBoard dto,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		dto.setmId(info.getUserId());
		
		int result = service.insertGroupBoard(dto, pathname);
		if(result<1){
			return "redirect:/community/group/article?groupNum="+dto.getGroupNum()+"&page="+page;
		}
		
		

		return "redirect:/community/group/article?groupNum="+dto.getGroupNum()+"&page="+page;
	}
	
	@RequestMapping(value="/community/group/boardDownload")
	public void download(
			@RequestParam int gbNum,
			@RequestParam(value = "groupNum") int groupNum,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"community";
		Map<String, Object> map = new HashMap<>();
		map.put("gbNum", gbNum);
		map.put("groupNum", groupNum);
		
		GroupBoard dto=service.readGroupBoard(map);
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
	
	@RequestMapping(value="/community/group/boardArticle")
	public String articleArti(
			@RequestParam(value = "gbNum") int gbNum,
			@RequestParam(value = "page") String page,
			@RequestParam(value = "groupNum") int groupNum,
			@RequestParam(value = "searchKey", defaultValue = "subject") String searchKey,
			@RequestParam(value = "searchValue", defaultValue = "") String searchValue,
			Model model) throws Exception {

		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		Map<String, Object> map = new HashMap<>();
		map.put("gbNum", gbNum);
		map.put("groupNum", groupNum);
		
		service.updateHitCount(map);

		GroupBoard dto = service.readGroupBoard(map);
		if (dto == null)
			return "redirect:/community/group/article?page=" + page+"&groupNum="+groupNum;

		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);

		GroupBoard preReadDto = service.preReadGroupBoard(map);
		GroupBoard nextReadDto = service.nextReadGroupBoard(map);

		String query = "groupNum="+groupNum+"&page=" + page;
		if (searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		model.addAttribute("groupNum", dto.getGroupNum());
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);

		return ".community_layout.group.boardArticle";
	}

	@RequestMapping(value = "/community/group/boardDelete")
	public String delete(
			@RequestParam int gbNum,
			@RequestParam int groupNum,
			@RequestParam String page,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";
		Map<String, Object> map = new HashMap<>();
		map.put("gbNum", gbNum);
		map.put("groupNum", groupNum);
		
		service.deleteGroupBoard(map, pathname, info.getUserId());

		String query = "groupNum="+groupNum+"&page="+page;

		return "redirect:/community/group/article?" + query;
	}

	@RequestMapping(value="/community/group/boardUpdate", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int gbNum,
			@RequestParam int groupNum,
			@RequestParam String page,
			Model model, 
			HttpSession session) throws Exception {

		String query = "groupNum="+groupNum+"&page="+page;

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> map = new HashMap<>();
		map.put("groupNum", groupNum);
		map.put("gbNum", gbNum);
		
		GroupBoard dto = service.readGroupBoard(map);
		if (dto == null) {
			return "redirect:/commuinty/group/article?" + query;
		}

		if (!info.getUserId().equals(dto.getmId())) {
			return "redirect:/commuinty/group/article?" + query;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("groupNum", dto.getGroupNum());
		model.addAttribute("page", page);
		model.addAttribute("mode", "update");

		return ".community_layout.group.boardCreated";
	}

	@RequestMapping(value="/community/group/boardUpdate", method=RequestMethod.POST)
	public String updateSubmit(
			GroupBoard dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String query = "groupNum="+dto.getGroupNum()+"&page=" + page;

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.updateGroupBoard(dto, pathname);

		return "redirect:/community/group/article?" + query;
	}

	@RequestMapping(value = "/community/group/boardDeleteFile")
	public String deleteFile(
			@RequestParam int gbNum,
			@RequestParam int groupNum,
			@RequestParam String page,
			HttpSession session) throws Exception {

		
		Map<String, Object> map = new HashMap<>();
		map.put("gbNum", gbNum);
		map.put("groupNum", groupNum);
		
		GroupBoard dto = service.readGroupBoard(map);

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";
		if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			dto.setSaveFilename(" ");
			dto.setOriginalFilename(" ");
			service.updateGroupBoard(dto, pathname);
		}
		String query = "groupNum="+ groupNum+ "&gbNum=" + gbNum + "&page=" + page;
		return "redirect:/community/group/boardUpdate?" + query;
	}
	
	@RequestMapping(value = "/community/group/insertLikeGroupBoard")
	@ResponseBody
	public Map<String, Object> insertLikeGroupBoard(
			GroupBoard dto, 
			@RequestParam(value = "gbNum") int gbNum,
			@RequestParam(value = "groupNum") int groupNum,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		dto.setGbNum(gbNum);
		dto.setGroupNum(groupNum);
		dto.setmId(info.getUserId());
		int result = service.insertLikeGroupBoard(dto);
		if (result == 0)
			state = "false";

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value = "/community/group/countLikeGroupBoard", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countLikePhoto(
			@RequestParam(value = "gbNum") int gbNum,
			@RequestParam(value = "groupNum") int groupNum
			) throws Exception {

		String state = "true";
		Map<String, Object> map = new HashMap<>();
		map.put("gbNum", gbNum);
		map.put("groupNum", groupNum);
		int countLikeGroupBoard = service.countLikeGroupBoard(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("countLikeGroupBoard", countLikeGroupBoard);

		return model;
	}
	
	@RequestMapping(value = "/community/group/board/insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdReply(
			GroupBoardReply dto,
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

	@RequestMapping(value = "/community/group/board/listReply")
	public String listReply(
			@RequestParam int gbNum,
			@RequestParam int groupNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("gbNum", gbNum);
		map.put("groupNum", groupNum);

		dataCount = service.replyDataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<GroupBoardReply> list = service.listReply(map);

		Iterator<GroupBoardReply> it = list.iterator();
		while (it.hasNext()) {
			GroupBoardReply vo = it.next();
			vo.setContent(myUtil.htmlSymbols(vo.getContent()));
		}

		String paging = myUtil.paging(current_page, total_page);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);

		return "community_layout/group/listReply";
	}

	// 댓글 및 댓글별답글 삭제
	@RequestMapping(value = "/community/group/board/deleteReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam int replyNum,
			@RequestParam int groupNum,
			@RequestParam String mode,
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mode", mode);
		map.put("groupNum", groupNum);
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
	@RequestMapping(value = "/community/group/board/listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam int answer, 
			@RequestParam int groupNum,
			Model model) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("answer", answer);
		map.put("groupNum", groupNum);
		List<GroupBoardReply> listReplyAnswer = service.listReplyAnswer(map);

		// 엔터를 <br>
		Iterator<GroupBoardReply> it = listReplyAnswer.iterator();
		while (it.hasNext()) {
			GroupBoardReply dto = it.next();
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}

		// jsp로 넘길 데이터
		model.addAttribute("listReplyAnswer", listReplyAnswer);

		return "community_layout/photo/listReplyAnswer";
	}

	// 댓글별 답글 개수
	@RequestMapping(value = "/community/group/board/replyCountAnswer", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyCountAnswer(
			@RequestParam int answer,
			@RequestParam int groupNum
			) throws Exception {

		int count = 0;
		Map<String, Object> map = new HashMap<>();
		map.put("answer", answer);
		map.put("groupNum", groupNum);
		count = service.replyCountAnswer(map);

		// 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>();
		model.put("count", count);
		return model;
	}
	
	
}
