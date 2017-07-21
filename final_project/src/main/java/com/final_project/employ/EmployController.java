package com.final_project.employ;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.omg.IOP.Encoding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.final_project.common.MyUtil;
import com.final_project.common.MyUtilBootstrap;
import com.final_project.member.SessionInfo;


@Controller("employ.EmployController")
public class EmployController {
	@Autowired
	EmployService service;
	
	@Autowired
	MyUtilBootstrap util;
	
	
	@RequestMapping("/employ/main")
	public String method(Model model) {
		
		//여기다가 sql - mapper - service 불러오는것까지 해본다.
		 Map<String, Object> map = new HashMap<String, Object>();
		
		 //메인업종리스트,서브업종리스트
		List<Employ> mblist= service.list_main_bu_class();
		List<Employ> sblist= service.list_sub_bu_class();
		
		//메인직종리스트,서브직종리스트
		List<Employ> mjlist= service.list_main_class();
		List<Employ> sjlist= service.list_sub_class();
		//자격증
		List<Employ> lclist=service.list_license();
		//우대사항
		List<Employ> cePlist = service.list_cePrefere();
		//근무조건
		List<Employ> ceTlist = service.list_ceType();
		//학력
		List<Employ> lalist = service.list_ability();
		int dataCount = service.dataCount();
		//지금 해야되는거 우대사항 학력 자격증 근무조건 컨트롤러로 받아와서 검색 바뀌게한다.
		//한개 먼저한다. 우대사항
		model.addAttribute("dataCount",dataCount);
		
		model.addAttribute("lalist",lalist);
		model.addAttribute("sblist",sblist);
		model.addAttribute("mblist",mblist);
		model.addAttribute("sjlist",sjlist);
		model.addAttribute("mjlist",mjlist);
		model.addAttribute("lclist",lclist);
		model.addAttribute("cePlist",cePlist);
		model.addAttribute("ceTlist",ceTlist);
		model.addAttribute("company","on");
		return ".employ_layout.employ.search";

	}
	
	@RequestMapping("/employ/rmfqhrl")
	public String read(Model model) {
		
		model.addAttribute("company","on");
		return ".employ_layout.employ.container";

	}
	
	@RequestMapping("/employ/list")
	@ResponseBody
	public Map<String, Object> list
			(
			EmployParams params
			,@RequestParam(value="page", defaultValue="1") int current_page
			,HttpSession session
			) {

		//리턴을 jsp페이지로 준다고 페이지가 꼭 바뀌는것은아니다. 위에서 했던것처럼..
		//get방식이면 바뀌지 않는다고 들었었다. 그것때문인듯하다.
		//그러니까 이방식으로 해본다. 가져올것들 db로 작성해서 컨트롤러로 가져와본다.
		Map<String, Object> map = new HashMap<>();
		map.put("startpay", params.getStartpay());
		map.put("endpay", params.getEndpay());
		map.put("cePrefere", params.getCePrefere());
		map.put("ceType", params.getCeType());
		map.put("ability", params.getAbility());
		map.put("subname", params.getSubname());
		map.put("sdate",params.getSdate());
		map.put("edate", params.getEdate());
		map.put("search", params.getSearch());
		map.put("cePlace", params.getCePlace());
		/*map.put("license", params.getLicense());*/
		//또 받아볼것 INSTR쓰는것 ceType근무조건 license자격증 cePrefere우대사항
		
		int rows=5;
		int dataCount = service.dataCount();
		int total_page = util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Employ> celist = service.llist_com_employ(map);
		Map<String, Object> model = new HashMap<>();
		
		String paging = util.paging(current_page, total_page);
		
		
		
		
		
		model.put("paging", paging);
		
		model.put("celist",celist);
		return model;
	}
	
	
	@RequestMapping("/employ/article")
	public  String article(
			@RequestParam int ceNum,
			Model model) {
		
		//받아와야할것 제목 날짜 조회수 내용
		//채용테이블 제목 인원 고용형태 시작일 마감일 연봉 무대사항 비고 이력서양식(첨부) 
		//기업이름 위치 학력 소분류
		Employ employ = service.read_com_employ(ceNum);
		model.addAttribute("employ",employ);
		
		return ".employ_layout.employ.article";
		
	}
	
	//json으로 값 보내기
	
	@RequestMapping("/employ/applyForm")
	@ResponseBody
	public  Map<String, Object> applyForm(int ceNum, HttpSession session) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		List<Resume> resumeList = service.read_resume(info.getUserId());
		
		Map<String, Object> model = new HashMap<>();
		Employ employ = service.read_com_employ(ceNum);
		model.put("employ",employ);
		model.put("resumeList", resumeList);
		return	model;
	}
	
	
	@RequestMapping("/employ/apply")
	@ResponseBody
	public int apply(int ceNum, int rNum) {
		int result=0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("ceNum", ceNum);
		map.put("rNum", rNum);
		result = service.apply_resume(map);
		
		return result;
	}
	
	@RequestMapping("/employ/scrap")
	@ResponseBody
	public int scrap(int ceNum, HttpSession session) {
		System.out.println("ceNum"+ceNum);
		int result=0;
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("ceNum", ceNum);
		map.put("mId", info.getUserId());
		result = service.add_scrap(map);
		System.out.println(result + info.getUserId() + map.get("mId"));
		return result;
	}
	
	@RequestMapping("/employ/detailapplyForm")
	@ResponseBody
	public  Map<String, Object> detailapplyForm(
			@RequestParam int ceNum
			, HttpSession session) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		List<Resume> resumeList = service.read_resume(info.getUserId());
		
		Map<String, Object> model = new HashMap<>();
		Employ employ = service.read_com_employ(ceNum);
		model.put("employ",employ);
		model.put("resumeList", resumeList);
		return	model;
	}
	
	@ExceptionHandler(SQLIntegrityConstraintViolationException.class)
	public void exception(SQLIntegrityConstraintViolationException e) {
		System.out.println("무결성오류");
	}

}
