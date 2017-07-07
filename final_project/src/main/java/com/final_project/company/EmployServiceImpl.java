package com.final_project.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service("company.employService")
public class EmployServiceImpl implements EmployService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertComEmploy(Employ dto, String pathname) throws Exception {
		try {
			if(dto.getCePayMin()!=null && dto.getCePayMin().length()!=0 &&
					dto.getCePayMax() != null && dto.getCePayMax().length()!=0)
				dto.setCePay(dto.getCePayMin() + "~" + dto.getCePayMin());
			
			if(!dto.getUpload().isEmpty()){
				String resumeFile=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setResumeFile(resumeFile);
				dto.setResumeOriginalName(dto.getUpload().getOriginalFilename());
			}
			
			dao.insertData("company.insertComImploy", dto);
		} catch (Exception e) {
			throw e;
		}
	}
}
