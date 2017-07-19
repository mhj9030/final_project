package com.final_project.community;

import java.util.List;
import java.util.Map;


public interface GroupService {
	public int insertGroup(Group dto, String pathname);
	public List<Group> listGroup(Map<String, Object> map);
	public List<Group> tagListGroup(Map<String, Object> map);
	public List<Group> myList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public int dataTagCount(Map<String, Object> map);
	public int insertTag(Map<String, Object> map);
	public int insertMember(Map<String, Object> map);
	public int createdLimit(Map<String, Object> map);
	public int groupNameCheck(Map<String, Object> map);
	public int readGroupNum();
	public List<GroupTag> tagList(int groupNum);
	public List<GroupTag> menuTag();
	public Group readGroup(Map<String, Object> map);
	
}
