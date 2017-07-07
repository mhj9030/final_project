package com.final_project.employ;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.omg.IOP.Encoding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("employ.EmployController")
public class EmployController {
	@Autowired
	EmployService service;
	
	
	
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
		
		//지금 해야되는거 우대사항 학력 자격증 근무조건 컨트롤러로 받아와서 검색 바뀌게한다.
		//한개 먼저한다. 우대사항
		
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
	public Map<String, Object> list(
			EmployParams params
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
		/*map.put("license", params.getLicense());*/
		//또 받아볼것 INSTR쓰는것 ceType근무조건 license자격증 cePrefere우대사항
		
		List<Employ> celist = service.llist_com_employ(map);
		Map<String, Object> model = new HashMap<>();
		
		
		
		
		
		model.put("celist",celist);
		return model;
	}
	
	@RequestMapping("/employ/article")
	public  String article() {
		
		return ".employ_layout.employ.article";
		
	}

}
