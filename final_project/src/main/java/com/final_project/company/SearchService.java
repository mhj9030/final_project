package com.final_project.company;

import java.util.List;
import java.util.Map;

public interface SearchService {
	public List<Company> listCompany(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public Company readCompanyNum(int cNum) throws Exception;
	public List<Company> listCompanyName() throws Exception;
}
