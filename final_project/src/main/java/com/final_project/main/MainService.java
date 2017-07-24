package com.final_project.main;

import java.util.List;

import com.final_project.community.Group;
import com.final_project.company.Company;

public interface MainService {
	public List<Company> listMainCompany() throws Exception;
	public List<Group> listMainGroup() throws Exception;
}
