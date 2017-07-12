package com.final_project.company;

import java.util.List;
import java.util.Map;

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
			
			dao.insertData("company.insertComEmploy", dto);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Employ> listComEmploy(Map<String, Object> map) throws Exception {
		List<Employ> list=null;
		
		try {
			list=dao.getListData("company.listComEmploy", map);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result=dao.getIntValue("company.employCount", map);
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public Employ readEmploy(int ceNum) throws Exception {
		Employ dto=null;
		
		try {
			dto=dao.getReadData("company.readEmploy", ceNum);
			
			if(dto!=null){
				if(dto.getCePay()!=null){
					dto.setCePayMin(dto.getCePay().split("~")[0]);
					dto.setCePayMax(dto.getCePay().split("~")[1]);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		
		return dto;
	}

	@Override
	public void updateComEmploy(Employ dto, String pathname) throws Exception {
		try {
			if(dto.getCePayMin()!=null && dto.getCePayMin().length()!=0 &&
					dto.getCePayMax() != null && dto.getCePayMax().length()!=0)
				dto.setCePay(dto.getCePayMin() + "~" + dto.getCePayMin());
			
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				String newFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				
				if (newFilename != null){
					if(dto.getResumeFile().length()!=0 && dto.getResumeFile()!=null){
						fileManager.doFileDelete(dto.getResumeFile(), pathname);
					}
					
					dto.setResumeOriginalName(dto.getUpload().getOriginalFilename());
					dto.setResumeFile(newFilename);
				}
			}
			
			dao.updateData("company.updateComEmploy", dto);
		} catch (Exception e) {
			throw e;
		}
	}
}
