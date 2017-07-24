package com.final_project.community;

import java.io.File;
import java.io.PrintWriter;
import java.util.Arrays;
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

@Controller("community.tipController")
public class TipController {
		
	@Autowired
	private TipService service;
	@Autowired
	private MyUtilBootstrap myUtil;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private PointService pointService;
	
	
	@RequestMapping("/community/tip")
	public String tip(Model model) throws Exception{
		model.addAttribute("tip","on");
		return ".community_layout.tip.list";
	}
	
	@RequestMapping(value = "/community/tip/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {

		model.addAttribute("mode", "created");

		return ".community_layout.tip.created";
	}

	@RequestMapping(value = "/community/tip/created", method = RequestMethod.POST)
	public String createdSubmit(Tip dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		dto.setmId(info.getUserId());
		
		Map<String, Object> map = new HashMap<>();
		map.put("history", "꿀팁작성");
		map.put("point", 500);
		map.put("mId", dto.getmId());
		pointService.savePoint(map);
		service.insertTip(dto, pathname);

		return "redirect:/community/tip";
	}
	
	@RequestMapping(value = "/community/tip/listTypes")
	public String listTypes(
			@RequestParam(value = "chk", defaultValue = "") String[] chk,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model, HttpServletRequest req) throws Exception {

		
		List<String> chkList=Arrays.asList(chk);

		int rows = 10;
		int total_page = 0;
		int dataCount = 0;


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", chkList);

		dataCount = service.dataCount(map);
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<Tip> list = service.listTip(map);

		int listNum, n = 0;
		Iterator<Tip> it = list.iterator();
		while (it.hasNext()) {
			Tip data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
			if(data.getType().equals("서비스업"))
				data.setType_color("#FFA98F");
			else if(data.getType().equals("제조/화학"))
				data.setType_color("#E1B771");
			else if(data.getType().equals("의료/복지"))
				data.setType_color("#D2691E");
			else if(data.getType().equals("판매/유통"))
				data.setType_color("#FFCFDA");
			else if(data.getType().equals("교육업"))
				data.setType_color("#FF5675");
			else if(data.getType().equals("건설업"))
				data.setType_color("#FFAAFF");
			else if(data.getType().equals("IT/통신"))
				data.setType_color("#3DFF92");
			else if(data.getType().equals("미디어/디자인"))
				data.setType_color("#000069");
			else if(data.getType().equals("은행/금융업"))
				data.setType_color("#80E12A");
			else if(data.getType().equals("기관/협회"))
				data.setType_color("#228B22");
			else if(data.getType().equals("직장인"))
				data.setType_color("#00A5FF");
			else if(data.getType().equals("공무원"))
				data.setType_color("#FFB400");
			else if(data.getType().equals("취준생"))
				data.setType_color("#8c008c");
			else if(data.getType().equals("알바생"))
				data.setType_color("#FF0000");
			else if(data.getType().equals("기타"))
				data.setType_color("#828282");
		}


		String paging = myUtil.paging(current_page, total_page);

		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "community_layout/tip/listType";
	}
	
	@RequestMapping(value="/community/tip/download")
	public void download(
			@RequestParam int jtnum,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"community";
		Tip dto=service.readTip(jtnum);
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
	
	
	@RequestMapping(value = "/community/tip/article")
	public String article(
			@RequestParam(value = "jtnum") int jtnum,
			@RequestParam(value = "chk", defaultValue = "") String[] chk,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model, HttpServletRequest req
			) throws Exception {
		

		service.updateHitCount(jtnum);

		Tip dto = service.readTip(jtnum);
		if (dto == null)
			return "ab";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jtnum", jtnum);

		Tip preReadDto = service.preReadTip(map);
		Tip nextReadDto = service.nextReadTip(map);

		String query = "page=" + current_page;

		model.addAttribute("chk", chk);
		model.addAttribute("dto", dto);
		model.addAttribute("page", current_page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		
		return "community_layout/tip/article";
	}
	
	@RequestMapping(value = "/community/tip/delete")
	public String delete(
			@RequestParam(value = "chk", defaultValue = "") String[] chk,
			@RequestParam(value = "jtnum") int jtnum, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session, Model model, HttpServletRequest req) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.deleteTip(jtnum, pathname, info.getUserId());
		
		return listTypes(chk, current_page, model, req);
		
	}
	
	@RequestMapping(value = "/community/tip/update", method = RequestMethod.GET)
	public String updateForm(
			@RequestParam int jtnum, 
			Model model, 
			HttpSession session) throws Exception {


		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Tip dto = service.readTip(jtnum);
		if (dto == null) {
			return "redirect:/commuinty/tip?";
		}

		if (!info.getUserId().equals(dto.getmId())) {
			return "redirect:/commuinty/tip?";
		}

		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");

		return ".community_layout.tip.created";
	}

	@RequestMapping(value = "/community/tip/update", method = RequestMethod.POST)
	public String updateSubmit(
			Tip dto, 
			HttpSession session) throws Exception {


		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";

		service.updateTip(dto, pathname);

		return "redirect:/community/tip";
	}

	@RequestMapping(value = "/community/tip/deleteFile")
	public String deleteFile(
			@RequestParam int jtnum, 
			@RequestParam String page,
			HttpSession session) throws Exception {

		Tip dto = service.readTip(jtnum);

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "community";
		if (dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);

			dto.setSaveFilename(" ");
			dto.setOriginalFilename(" ");
			service.updateTip(dto, pathname);
		}
		String query = "jtnum=" + jtnum;
		return "redirect:/community/tip/update?" + query;
	}
	
	@RequestMapping(value = "/community/tip/insertLikeTip", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertLikeTip(
			Tip dto, 
			@RequestParam(value = "jtnum") int jtnum, 
			HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		dto.setJtnum(jtnum);
		dto.setmId(info.getUserId());
		int result = service.insertLikeTip(dto);
		if (result == 0)
			state = "false";

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value = "/community/tip/countLikeTip", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> countLikePhoto(
			@RequestParam(value="jtnum") int jtnum) throws Exception {

		String state = "true";
		int countLikeTip = service.countLikeTip(jtnum);
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("countLikeTip", countLikeTip);

		return model;
	}
	

	@RequestMapping(value = "/community/tip/insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdReply(
			TipReply dto,
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

	@RequestMapping(value = "/community/tip/listReply")
	public String listReply(
			@RequestParam int jtnum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("jtnum", jtnum);

		dataCount = service.replyDataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);

		List<TipReply> list = service.listReply(map);

		Iterator<TipReply> it = list.iterator();
		while (it.hasNext()) {
			TipReply vo = it.next();
			vo.setContent(myUtil.htmlSymbols(vo.getContent()));
		}

		String paging = myUtil.pagingMethod(current_page, total_page, "listReply");

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);

		return "community_layout/tip/listReply";
	}

	// 댓글 및 댓글별답글 삭제
	@RequestMapping(value = "/community/tip/deleteReply", method = RequestMethod.POST)
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
	@RequestMapping(value = "/community/tip/listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam int answer, 
			Model model) throws Exception {

		List<TipReply> listReplyAnswer = service.listReplyAnswer(answer);

		// 엔터를 <br>
		Iterator<TipReply> it = listReplyAnswer.iterator();
		while (it.hasNext()) {
			TipReply dto = it.next();
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}

		// jsp로 넘길 데이터
		model.addAttribute("listReplyAnswer", listReplyAnswer);

		return "community_layout/tip/listReplyAnswer";
	}

	// 댓글별 답글 개수
	@RequestMapping(value = "/community/tip/replyCountAnswer", method = RequestMethod.POST)
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
