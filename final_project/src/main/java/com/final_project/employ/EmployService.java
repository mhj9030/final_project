package com.final_project.employ;

import java.util.List;
import java.util.Map;


public interface EmployService {
	public List<Employ> list_main_bu_class();
	public List<Employ> list_sub_bu_class();
	public List<Employ> list_main_class();
	public List<Employ> list_sub_class();
	public List<Employ> llist_com_employ(Map<String, Object> map);
	public List<Employ> list_license();
	public List<Employ> list_cePrefere();
	public List<Employ> list_ceType();
	public List<Employ> list_ability();
	public Employ read_com_employ(int ceNum);
	public List<Resume> read_resume(String mId);
	public int apply_resume(Map<String, Object> map);
}
