package com.final_project.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service
public class CreatedServiceImpl implements CreatedService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertCompany(Company dto, String pathname) throws Exception {
		try {
			dao.insertData("company.insertCompany", dto);
			
			if(!dto.getUpload().isEmpty()){
				for(MultipartFile mf:dto.getUpload()){
					if(mf.isEmpty())
						continue;
					
					String cSaveFilename=fileManager.doFileUpload(mf, pathname);
					
					if(cSaveFilename!=null){
						String cOriginalFilename=mf.getOriginalFilename();
						
						dto.setcOriginalFilename(cOriginalFilename);
						dto.setcSaveFilename(cSaveFilename);
						
						insertComImage(dto);
					}
				}
			}
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void insertComImage(Company dto) throws Exception {
		try {
			dao.insertData("company.insertComImage", dto);
		} catch (Exception e) {
			throw e;
		}
	}
}











