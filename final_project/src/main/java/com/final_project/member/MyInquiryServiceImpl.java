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

	@Override
	public MyInquiry readMyInquiry(int cqNum) throws Exception {
		MyInquiry dto=null;
		
		try {
			dto=dao.getReadData("myInquiry.readMyInquiry", cqNum);
		} catch (Exception e) {
			throw e;
		}
		
		return dto;
	}

	@Override
	public MyInquiry preReadMyInquiry(Map<String, Object> map) throws Exception {
		MyInquiry preDto=null;
		
		try {
			preDto=dao.getReadData("myInquiry.preReadMyInquiry", map);
		} catch (Exception e) {
			throw e;
		}

		return preDto;
	}

	@Override
	public MyInquiry nextReadMyInquiry(Map<String, Object> map) throws Exception {
		MyInquiry nextDto=null;
		
		try {
			nextDto=dao.getReadData("myInquiry.nextReadMyInquiry", map);
		} catch (Exception e) {
			throw e;
		}

		return nextDto;
	}

	@Override
	public void deleteMyInquiry(int cqNum) throws Exception {
		try {
			dao.deleteData("myInquiry.deleteMyInquiry", cqNum);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void updateMyInquiry(MyInquiry dto) throws Exception {
		try {
			dao.updateData("myInquiry.updateMyInquiry", dto);
		} catch (Exception e) {
			throw e;
		}
	}
}
