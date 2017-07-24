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
	public int deleteGroupTable(int seq) {
		int result=0;
		try {
			dao.updateData("community_group.dropBoardReplyTable", seq);
			dao.updateData("community_group.dropBoardLikeTable", seq);
			dao.updateData("community_group.dropBoardTable", seq);
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
	public GroupBoard readGroupBoard(Map<String, Object> map) {
		GroupBoard dto = null;
		
		try {
			dto = dao.getReadData("community_group.readGroupBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.updateData("community_group.updatehitCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public GroupBoard preReadGroupBoard(Map<String, Object> map) {
		GroupBoard dto = null;
		try {
			dto = dao.getReadData("community_group.preReadGroupBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public GroupBoard nextReadGroupBoard(Map<String, Object> map) {
		GroupBoard dto = null;
		try {
			dto = dao.getReadData("community_group.nextReadGroupBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateGroupBoard(GroupBoard dto, String pathname) {
		int result=0;

		try{
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
				if (newFilename != null) {
					// 이전 파일 지우기
					if(dto.getSaveFilename()!=null && dto.getSaveFilename().length()!=0) {
						fileManager.doFileDelete(dto.getSaveFilename(), pathname);
					}
					
					dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
					dto.setSaveFilename(newFilename);
				}
			}
			
			result= dao.updateData("community_group.updateGroupBoard", dto);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteGroupBoard(Map<String, Object> map, String pathname, String mId) {
		int result = 0;
		
		try {
			GroupBoard dto= readGroupBoard(map);
			if(dto!=null) {
				if(! dto.getmId().equals(mId) && ! mId.equals("admin@a.com"))
					return result;
				
				if(dto.getSaveFilename()!=null&&dto.getSaveFilename().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			
			result = dao.deleteData("community_group.deleteGroupBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertLikeGroupBoard(GroupBoard dto) {
		int result = 0;
		try {
			result = dao.insertData("community_group.insertLikeGroupBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countLikeGroupBoard(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.getIntValue("community_group.countLikeGroupBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
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

	@Override
	public int insertReply(GroupBoardReply dto) {
		int result = 0;
		
		try {
			
			int maxNum = dao.getIntValue("community_group.maxGroupBoardReplyNum", dto);
			dto.setReplyNum(maxNum+1);
			result = dao.insertData("community_group.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<GroupBoardReply> listReply(Map<String, Object> map) {
		List<GroupBoardReply> list = null;
		
		try {
			list = dao.getListData("community_group.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<GroupBoardReply> listReplyAnswer(Map<String, Object> map) {
		List<GroupBoardReply> list=null;
		try {
			list=dao.getListData("community_group.listReplyAnswer", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("community_group.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int replyCountAnswer(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("community_group.replyCountAnswer", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("community_group.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<GroupMember> listGroupMember(Map<String, Object> map) {
		List<GroupMember> list = null;
		try {
			list = dao.getListData("community_group.listGroupMember", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateGroup(Group dto, String pathname) {
		int result = 0;
		try{
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				if (newFilename != null) {
					// 이전 파일 지우기
					if(dto.getSaveFilename()!=null && dto.getSaveFilename().length()!=0) {
						fileManager.doFileDelete(dto.getSaveFilename(), pathname);
					}
					
					dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
					dto.setSaveFilename(newFilename);
					
				}
			}
			result= dao.updateData("community_group.updateGroup", dto);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteGroup(int groupNum, String pathname, String mId) {
		int result = 0;
		try {
			
			Map<String, Object> map = new HashMap<>();
			map.put("groupNum", groupNum);
			Group dto= readGroup(map);
			if(dto!=null) {
				if(! dto.getmId().equals(mId) && ! mId.equals("admin@a.com"))
					return result;
				
				if(dto.getSaveFilename()!=null&&dto.getSaveFilename().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			deleteGroupTable(groupNum);
			result = dao.deleteData("community_group.deleteGroup", map);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int joinGroup(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.insertData("community_group.joinGroup", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int outGroup(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.deleteData("community_group.outGroup", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}