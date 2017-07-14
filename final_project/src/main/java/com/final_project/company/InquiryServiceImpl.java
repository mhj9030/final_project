package com.final_project.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("company.inquiryService")
public class InquiryServiceImpl implements InquiryService{
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertInquiry(Inquiry dto) throws Exception {
		try {
			dao.insertData("insertInquiry", dto);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result=dao.getIntValue("company.inquiryCount", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public List<Inquiry> listInquiry(Map<String, Object> map) throws Exception {
		List<Inquiry> list=null;
		
		try {
			list=dao.getListData("company.listInquiry", map);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

	@Override
	public Inquiry readInquiry(int cqNum) throws Exception {
		Inquiry dto=null;
		
		try {
			dto=dao.getReadData("company.readInquiry", cqNum);
		} catch (Exception e) {
			throw e;
		}
		
		return dto;
	}

	@Override
	public void insertAnswerInquiry(Inquiry dto) throws Exception {
		try {
			dao.insertData("company.insertAnswerInquiry", dto);
		} catch (Exception e) {
			throw e;
		}
	}
}
