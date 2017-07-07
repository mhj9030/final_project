package com.final_project.employ;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("employ.EmployService")
public class EmployServiceImpl implements EmployService{
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Employ> list_sub_bu_class() {
		List<Employ> list = null;
		
		try {
			list=dao.getListData("employ.list_sub_bu_class");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public List<Employ> list_main_bu_class() {
		List<Employ> list = null;
		
		try {
			list=dao.getListData("employ.list_main_bu_class");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public List<Employ> list_main_class() {
		List<Employ> list = null;
		
		try {
			list=dao.getListData("employ.list_main_class");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Employ> list_sub_class() {
		List<Employ> list = null;
		
		try {
			list=dao.getListData("employ.list_sub_class");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Employ> llist_com_employ(Map<String, Object> map) {
		List<Employ> list = null;
		
		try {
			list=dao.getListData("employ.list_com_employ",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Employ> list_license() {
		List<Employ> list = null;
		
		try {
			list=dao.getListData("employ.list_license");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Employ> list_cePrefere() {
		List<Employ> list = null;
		
		try {
			list=dao.getListData("employ.list_cePrefere");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Employ> list_ceType() {
		List<Employ> list = null;
		
		try {
			list=dao.getListData("employ.list_ceType");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Employ> list_ability() {
		List<Employ> list = null;
		
		try {
			list=dao.getListData("employ.list_ability");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	

	

	
	
	
	
}
