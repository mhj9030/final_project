package com.final_project.company;

import java.util.List;
import java.util.Map;

public interface EmployService {
	public void insertComEmploy(Employ dto, String pathname) throws Exception;
	public List<Employ> listComEmploy(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public Employ readEmploy(int ceNum) throws Exception;
	public void updateComEmploy(Employ dto, String pathname) throws Exception;
}
