package com.final_project.setting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service
public class SettingServiceImpl implements SettingService {

	@Autowired
	private CommonDAO dao;

	@Override
	public int insertCareer(Career dto) {
		int result = 0;

		try {
			result = dao.insertData("setting.insertCareer", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int insertAbility(Ability dto) {
		int result = 0;

		try {
			result = dao.insertData("setting.insertAbility", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertExpertise(Expertise dto) {
		int result = 0;

		try {
			result = dao.insertData("setting.insertExpertise", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int updateExpertise(Expertise dto) {
		int result = 0;
		try {
			result = dao.updateData("setting.updateExpertise", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertProject(Project dto) {
		int result = 0;
		try {
			result = dao.insertData("setting.insertProject", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
