package com.final_project.setting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public int insertCareer(Setting dto) {
		int result = 0;
		
		try {
			result = dao.insertData("setting.insertCareer", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return result;
	}

}
