package com.final_project.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service("community.photoService")
public class PhotoServiceImpl implements PhotoService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public int insertPhoto(Photo dto, String pathname) {
		int result=0;
		try {
			if(! dto.getUpload().isEmpty()){
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			result = dao.insertData("community_photo.insertPhoto", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Photo> listPhoto(Map<String, Object> map) {
		List<Photo> list = null;
		
		try{
			list=dao.getListData("community_photo.listPhoto",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0 ;
		
		try {
			result = dao.getIntValue("community_photo.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Photo readPhoto(int ptnum) {
		Photo dto = null;
		
		try {
			dto = dao.getReadData("community_photo.readPhoto", ptnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int ptnum) {
		int result = 0;
		
		try {
			result = dao.updateData("community_photo.updatehitCount", ptnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Photo preReadPhoto(Map<String, Object> map) {
		Photo dto = null;
		try {
			dto = dao.getReadData("community_photo.preReadPhoto", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Photo nextReadPhoto(Map<String, Object> map) {
		Photo dto = null;
		try {
			dto = dao.getReadData("community_photo.nextReadPhoto", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updatePhoto(Photo dto, String pathname) {
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
			
			result= dao.updateData("community_photo.updatePhoto", dto);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deletePhoto(int ptnum, String pathname, String mId) {
		int result = 0;
		
		try {
			Photo dto= readPhoto(ptnum);
			if(dto!=null) {
				if(! dto.getmId().equals(mId) && ! mId.equals("admin@a.com"))
					return result;
				
				if(dto.getSaveFilename()!=null&&dto.getSaveFilename().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			
			result = dao.deleteData("community_photo.deletePhoto", ptnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertLikePhoto(Photo dto) {
		int result = 0;
		try {
			result = dao.insertData("community_photo.insertLikePhoto", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countLikePhoto(int ptnum) {
		int result = 0;
		try {
			result = dao.getIntValue("community_photo.countLikePhoto", ptnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReply(PhotoReply dto) {
		int result = 0;
		
		try {
			result = dao.insertData("community_photo.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<PhotoReply> listReply(Map<String, Object> map) {
		List<PhotoReply> list = null;
		
		try {
			list = dao.getListData("community_photo.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<PhotoReply> listReplyAnswer(int answer) {
		List<PhotoReply> list=null;
		try {
			list=dao.getListData("community_photo.listReplyAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("community_photo.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int replyCountAnswer(int answer) {
		int result=0;
		try {
			result=dao.getIntValue("community_photo.replyCountAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("community_photo.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
