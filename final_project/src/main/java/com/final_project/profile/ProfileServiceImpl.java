package com.final_project.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("profile.profileService")
public class ProfileServiceImpl implements ProfileService {
	
	@Autowired
	private CommonDAO cDao;

	
	// 프로파일 가져오기
	@Override
	public Profile profileRead(String mid) {
		Profile dto = null;
		
		try {
			dto = cDao.getReadData("profile.readProfile", mid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
