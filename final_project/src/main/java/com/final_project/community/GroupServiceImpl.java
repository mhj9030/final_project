package com.final_project.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service("community.groupService")
public class GroupServiceImpl implements GroupService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertGroup(Group dto, String pathname) {
		int result = 0;
		
		try {
			if(! dto.getUpload().isEmpty()){
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			result = dao.insertData("community_group.insertGroup", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	@Override
	public List<Group> listGroup(Map<String, Object> map) {
		List<Group> list = null;
		
		try{
			list=dao.getListData("community_group.listGroup",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0 ;
		
		try {
			result = dao.getIntValue("community_group.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	@Override
	public int insertTag(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.insertData("community_group.insertTag", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public int readGroupNum() {
		int result = 0;
		
		try {
			result = dao.getIntValue("community_group.readMaxnum");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public List<GroupTag> tagList(int groupNum) {
		List<GroupTag> list =null;
		try {
			list = dao.getListData("community_group.listTag", groupNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	@Override
	public List<GroupTag> menuTag() {
		List<GroupTag> list = null;
		
		try {
			list = dao.getListData("community_group.menuTag");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	@Override
	public List<Group> tagListGroup(Map<String, Object> map) {
		List<Group> list = null;
		
		try{
			list=dao.getListData("community_group.tagListGroup",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	@Override
	public int dataTagCount(Map<String, Object> map) {
		int result = 0 ;
		try {
			result = dao.getIntValue("community_group.dataTagCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int createdLimit(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("community_group.createdLimit", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	@Override
	public int groupNameCheck(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("community_group.groupNameCheck", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int insertMember(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.insertData("community_group.insertMember",  map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	@Override
	public List<Group> myList(Map<String, Object> map) {
		List<Group> list = null;
		
		try {
			list = dao.getListData("community_group.mylistGroup", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	@Override
	public Group readGroup(Map<String, Object> map) {
		Group dto = null;
		try {
			dto = dao.getReadData("community_group.readGroup", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}