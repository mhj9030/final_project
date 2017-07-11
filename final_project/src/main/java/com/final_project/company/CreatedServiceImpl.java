package com.final_project.company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service("company.createdService")
public class CreatedServiceImpl implements CreatedService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertCompany(Company dto, String pathname) throws Exception {
		try {
			if(dto.getcSerial1()!=null && dto.getcSerial1().length()!=0 &&
					dto.getcSerial2() != null && dto.getcSerial2().length()!=0 &&
							dto.getcSerial3() != null && dto.getcSerial3().length()!=0)
				dto.setcSerial(dto.getcSerial1() + "-" + dto.getcSerial2() + "-" + dto.getcSerial3());
			
			if(dto.getcTel1()!=null && dto.getcTel1().length()!=0 &&
					dto.getcTel2() != null && dto.getcTel2().length()!=0 &&
							dto.getcTel3() != null && dto.getcTel3().length()!=0)
				dto.setcTel(dto.getcTel1() + "-" + dto.getcTel2() + "-" + dto.getcTel3());
			
			dao.insertData("company.insertCompany", dto);
			
			for(int i=0; i<dto.getUpload().size(); i++){
				MultipartFile mf=dto.getUpload().get(i);
				String imageFile=fileManager.doFileUpload(mf, pathname);
				
				if(i==0){
					dto.setcLogoImage(imageFile);
					
					if(imageFile!=null){
						String cOriginalFilename=mf.getOriginalFilename();
						dto.setcLogoOriginalFilename(cOriginalFilename);
					}
				}else{
					dto.setcCoverImage(imageFile);
					
					if(imageFile!=null){
						String cOriginalFilename=mf.getOriginalFilename();
						dto.setcCoverOriginalFilename(cOriginalFilename);
					}
				}	
			}
			
			insertComImage(dto);
			
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

	@Override
	public void updateCompany(Company dto, String pathname) throws Exception {
		try {
			if(dto.getcSerial1()!=null && dto.getcSerial1().length()!=0 &&
					dto.getcSerial2() != null && dto.getcSerial2().length()!=0 &&
							dto.getcSerial3() != null && dto.getcSerial3().length()!=0)
				dto.setcSerial(dto.getcSerial1() + "-" + dto.getcSerial2() + "-" + dto.getcSerial3());
			
			if(dto.getcTel1()!=null && dto.getcTel1().length()!=0 &&
					dto.getcTel2() != null && dto.getcTel2().length()!=0 &&
							dto.getcTel3() != null && dto.getcTel3().length()!=0)
				dto.setcTel(dto.getcTel1() + "-" + dto.getcTel2() + "-" + dto.getcTel3());
			
			dao.updateData("company.updateCompany", dto);
			
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()){
				for(int i=0; i<dto.getUpload().size(); i++){
					MultipartFile mf=dto.getUpload().get(i);
					String newImageFile=fileManager.doFileUpload(mf, pathname);
					
					if(i==0){
						if(newImageFile!=null){
							if(dto.getcLogoImage().length()!=0 && dto.getcLogoImage()!=null){
								fileManager.doFileDelete(dto.getcLogoImage(), pathname);
							}
							
							dto.setcLogoOriginalFilename(mf.getOriginalFilename());
							dto.setcLogoImage(newImageFile);
						}
					} else{
						if(newImageFile!=null){
							if(dto.getcLogoImage().length()!=0 && dto.getcLogoImage()!=null){
								fileManager.doFileDelete(dto.getcLogoImage(), pathname);
							}
							
							dto.setcCoverOriginalFilename(mf.getOriginalFilename());
							dto.setcCoverImage(newImageFile);
						}
					}
				}
			}
			
			dao.updateData("company.updateComImage", dto);
		} catch (Exception e) {
			throw e;
		}		
	}
	
	@Override
	public Company readCompanySerial(String cSerial) throws Exception {
		Company dto=null;
		
		try {
			dto=dao.getReadData("company.readCompanySerial", cSerial);
			
			if(dto!=null){
				if(dto.getcSerial()!=null){
					dto.setcSerial1(dto.getcSerial().split("-")[0]);
					dto.setcSerial2(dto.getcSerial().split("-")[1]);
					dto.setcSerial3(dto.getcSerial().split("-")[2]);
				}
				
				if(dto.getcTel()!=null){
					dto.setcTel1(dto.getcTel().split("-")[0]);
					dto.setcTel2(dto.getcTel().split("-")[1]);
					dto.setcTel3(dto.getcTel().split("-")[2]);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		
		return dto;
	}
}











