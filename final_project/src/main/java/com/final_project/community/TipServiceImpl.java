package com.final_project.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service("community.tipService")
public class TipServiceImpl implements TipService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertTip(Tip dto, String pathname) {
		int result=0;
		try {
			if(! dto.getUpload().isEmpty()){
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			result = dao.insertData("community_tip.insertTip", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Tip> listTip(Map<String, Object> map) {
		List<Tip> list = null;
		
		try{
			list=dao.getListData("community_tip.listTip",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0 ;
		
		try {
			result = dao.getIntValue("community_tip.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Tip readTip(int jtnum) {
		Tip dto = null;
		
		try {
			dto = dao.getReadData("community_tip.readTip", jtnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int jtnum) {
		int result = 0;
		
		try {
			result = dao.updateData("community_tip.updatehitCount", jtnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Tip preReadTip(Map<String, Object> map) {
		Tip dto = null;
		try {
			dto = dao.getReadData("community_tip.preReadTip", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Tip nextReadTip(Map<String, Object> map) {
		Tip dto = null;
		try {
			dto = dao.getReadData("community_tip.nextReadTip", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateTip(Tip dto, String pathname) {
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
			
			result= dao.updateData("community_tip.updateTip", dto);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteTip(int jtnum, String pathname, String mId) {
		int result = 0;
		
		try {
			Tip dto= readTip(jtnum);
			if(dto!=null) {
				if(! dto.getmId().equals(mId) && ! mId.equals("admin@a.com"))
					return result;
				
				if(dto.getSaveFilename()!=null&&dto.getSaveFilename().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			
			result = dao.deleteData("community_tip.deleteTip", jtnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertLikeTip(Tip dto) {
		int result = 0;
		try {
			result = dao.insertData("community_tip.insertLikeTip", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countLikeTip(int jtnum) {
		int result = 0;
		try {
			result = dao.getIntValue("community_tip.countLikeTip", jtnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReply(TipReply dto) {
		int result = 0;
		
		try {
			result = dao.insertData("community_tip.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<TipReply> listReply(Map<String, Object> map) {
		List<TipReply> list = null;
		
		try {
			list = dao.getListData("community_tip.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<TipReply> listReplyAnswer(int answer) {
		List<TipReply> list=null;
		try {
			list=dao.getListData("community_tip.listReplyAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("community_tip.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int replyCountAnswer(int answer) {
		int result=0;
		try {
			result=dao.getIntValue("community_tip.replyCountAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("community_tip.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	

}
