package com.final_project.community;

import java.util.HashMap;
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
	public int maxGroupSeq() {
		int result=0;
		try {
			result=dao.getReadData("community_group.maxGroupSeq");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int insertGroup(Group dto, String pathname) {
		int result = 0;
		
		try {
			if(! dto.getUpload().isEmpty()){
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			int seq = maxGroupSeq()+1;
			dto.setGroupNum(seq);
			dao.insertData("community_group.insertGroup", dto);
			
			createGroupTable(seq);
			
			result = 1;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public int createGroupTable(int seq) {
		int result=0;
		try {
			dao.updateData("community_group.createBoardTable", seq);
			dao.updateData("community_group.createBoardLikeTable", seq);
			dao.updateData("community_group.createBoardReplyTable", seq);
			
			result=1;
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

	
	@Override
	public int maxGroupBoardSeq(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getReadData("community_group.maxGroupBoardSeq" ,map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int insertGroupBoard(GroupBoard dto, String pathname) {
		int result=0;
		try {
			if(! dto.getUpload().isEmpty()){
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			Map<String, Object> map = new HashMap<>();
			map.put("groupNum", dto.getGroupNum());
			dto.setGbNum(maxGroupBoardSeq(map)+1);

			result = dao.insertData("community_group.insertGroupBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<GroupBoard> listGroupBoard(Map<String, Object> map) {
		List<GroupBoard> list = null;
		
		try{
			list=dao.getListData("community_group.listGroupBoard",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCountBoard(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("community_group.dataCountBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public GroupBoard readGroupBoard(int gbNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int gbNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public GroupBoard preReadGroupBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GroupBoard nextReadGroupBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateGroupBoard(GroupBoard dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteGroupBoard(int gbNum, String pathname, String mId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLikeGroupBoard(GroupBoard dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countLikeGroupBoard(int gbNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkGroupMember(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("community_group.checkGroupMember", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}