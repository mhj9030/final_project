package com.final_project.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service("profile.profileService")
public class ProfileServiceImpl implements ProfileService {
	
	@Autowired
	private CommonDAO cDao;
	@Autowired
	private FileManager fileManager;

	
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


	@Override
	public void updateProfile(Profile dto, String pathname) throws Exception {
		try {
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				String newFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				
				if(newFilename!=null){
					if(dto.getProPhoto()!=null && dto.getProPhoto().length()!=0){
						fileManager.doFileDelete(dto.getProPhoto(), pathname);
					}
					
					dto.setProPhoto(newFilename);
				}
			}
			
			cDao.updateData("profile.updateProfile", dto);
		} catch (Exception e) {
			throw e;
		}
	}
}
