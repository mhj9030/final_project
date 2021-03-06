package com.final_project.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;
import com.final_project.community.Group;
import com.final_project.company.Company;
import com.final_project.help.Notice;

@Service("mainService")
public class MainServiceImpl implements MainService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Company> listMainCompany() throws Exception {
		List<Company> list=null;
		
		try {
			list=dao.getListData("company.listMainCompany");
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

	@Override
	public List<Group> listMainGroup() throws Exception {
		List<Group> list = null;
		try {
			list = dao.getListData("community_group.listMainGroup");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list=null;
		
		try{
			list=dao.getListData("notice.listNotice", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

}
