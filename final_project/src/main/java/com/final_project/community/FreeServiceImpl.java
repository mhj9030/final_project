package com.final_project.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service("community.freeService")
public class FreeServiceImpl implements FreeService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertFree(Free dto, String pathname) {
		int result=0;
		try {
			if(! dto.getUpload().isEmpty()){
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			if(dto.getMode().equals("created")) {
				int maxNum=dao.getIntValue("community_free.maxfrnum");
				dto.setFrnum(maxNum+1);
				dto.setGroupNum(dto.getFrnum());
				
			} else if(dto.getMode().equals("follow")) {
				// orderNo 변경
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("groupNum", dto.getGroupNum());
				map.put("orderNo", dto.getOrderNo());
				dao.updateData("community_free.updateOrderNo", map);

				int maxNum=dao.getIntValue("community_free.maxfrnum");
				dto.setFrnum(maxNum+1);
				dto.setDepth(dto.getDepth() + 1);
				dto.setOrderNo(dto.getOrderNo() + 1);
			}
			
			result=dao.insertData("community_free.insertFree", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Free> listFree(Map<String, Object> map) {
		List<Free> list = null;
		
		try{
			list=dao.getListData("community_free.listFree",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0 ;
		
		try {
			result = dao.getIntValue("community_free.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Free readFree(int frnum) {
		Free dto = null;
		
		try {
			dto = dao.getReadData("community_free.readFree", frnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int frnum) {
		int result = 0;
		
		try {
			result = dao.updateData("community_free.updatehitCount", frnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Free preReadFree(Map<String, Object> map) {
		Free dto = null;
		
		try {
			dto = dao.getReadData("community_free.preReadFree", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public Free nextReadFree(Map<String, Object> map) {
		Free dto = null;
		
		try {
			dto = dao.getReadData("community_free.nextReadFree", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateFree(Free dto, String pathname) {
		int result=0;

		try{
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
				if (newFilename != null) {
					// 이전 파일 지우기
					if(dto.getSaveFilename().length()!=0 && dto.getSaveFilename()!=null) {
						fileManager.doFileDelete(dto.getSaveFilename(), pathname);
					}
					
					dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
					dto.setSaveFilename(newFilename);
				}
			}
			
			result= dao.updateData("community_free.updateFree", dto);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteFree(int frnum, String pathname, String mId) {
		int result = 0;
		
		try {
			Free dto= readFree(frnum);
			if(dto!=null) {
				if(! dto.getmId().equals(mId) && ! mId.equals("admin@a.com"))
					return result;
				
				if(dto.getSaveFilename()!=null&&dto.getSaveFilename().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			
			result = dao.deleteData("community_free.deleteFree", frnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertLikeFree(Free dto) {
		int result = 0;
		try {
			result = dao.insertData("community_free.insertLikeFree", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countLikeFree(int frnum) {
		int result = 0;
		try {
			result = dao.getIntValue("community_free.countLikeFree", frnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReply(FreeReply dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FreeReply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FreeReply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyCountAnswer(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}




}