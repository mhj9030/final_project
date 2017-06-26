package com.final_project.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("company.companyService")
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertCompay(Company dto) {
		// TODO Auto-generated method stub
		
	}
}
