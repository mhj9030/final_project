package com.final_project.main;

import java.util.List;
import java.util.Map;

import com.final_project.community.Group;
import com.final_project.company.Company;
import com.final_project.help.Notice;

public interface MainService {
	public List<Company> listMainCompany() throws Exception;
	public List<Group> listMainGroup() throws Exception;
	public List<Notice> listNotice(Map<String, Object> map) throws Exception;
}
