package com.final_project.company;

public interface CreatedService {
	public void insertCompany(Company dto, String pathname) throws Exception;
	public void insertComImage(Company dto) throws Exception;
	public void updateCompany(Company dto, String pathname) throws Exception;
	public Company readCompanyId(String mId) throws Exception;
}
