package com.final_project.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("member.MyInquiryService")
public class MyInquiryServiceImpl implements MyInquiryService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result=dao.getIntValue("myInquiry.countMyInquiry", map);
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public List<MyInquiry> listMyInquiry(Map<String, Object> map) throws Exception {
		List<MyInquiry> list=null;
		
		try {
			list=dao.getListData("myInquiry.listMyInquiry", map);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}
	
}
