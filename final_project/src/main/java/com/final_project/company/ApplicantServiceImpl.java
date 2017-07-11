package com.final_project.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("company.applicantService")
public class ApplicantServiceImpl implements ApplicantService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Applicant> listApplicant(Map<String, Object> map) throws Exception {
		List<Applicant> list=null;
		
		try {
			list=dao.getListData("company.listApplicant", map);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

	@Override
	public int dataCount(int ceNum) throws Exception {
		int result=0;
		
		try {
			result=dao.getIntValue("company.applicantCount", ceNum);
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public List<Employ> applicantListEmploy(String cSerial) throws Exception {
		List<Employ> list=null;
		
		try {
			list=dao.getListData("company.applicantListEmploy", cSerial);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}
}
