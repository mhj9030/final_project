package com.final_project.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("company.searchService")
public class SearchServiceImpl implements SearchService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Company> listCompany(Map<String, Object> map) throws Exception{
		List<Company> list=null;
		
		try {
			list=dao.getListData("company.listCompany", map);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result=dao.getIntValue("company.companyCount", map);
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public Company readCompanyNum(int cNum) throws Exception {
		Company dto=null;
		
		try {
			dto=dao.getReadData("company.readCompanyNum", cNum);
		} catch (Exception e) {
			throw e;
		}
		
		return dto;
	}

	@Override
	public List<Company> listCompanyName(Map<String, Object> map) throws Exception {
		List<Company> list=null;
		
		try {
			list=dao.getListData("company.listCompanyName", map);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

	@Override
	public String searchCompanyName(int cNum) throws Exception {
		String cName=null;
		
		try {
			cName=dao.getReadData("company.searchCompanyName", cNum);
		} catch (Exception e) {
			throw e;
		}
		
		return cName;
	}
}
