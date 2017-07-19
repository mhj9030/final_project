package com.final_project.help;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;
import com.final_project.community.Photo;

@Service("help.eventService")
public class EventServiceImpl implements EventService {
	@Autowired
	private CommonDAO  dao;
	@Autowired
	private FileManager fileManager;

	@Override
	public int insertEvent(Event dto, String path) {
		int result=0;
		
		try {
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()) {
				// 파일 업로드
				String newFilename=fileManager.doFileUpload(dto.getUpload(), path);
				dto.setImageFilename(newFilename);

				result=dao.insertData("event.insertEvent", dto);
			}
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.getIntValue("event.dataCount", map);
		} catch (Exception e) {
		}
		
		return result;
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list=null;
		
		try {
			list=dao.getListData("event.listEvent", map);
		} catch (Exception e) {
		}
		
		return list;
	}

	@Override
	public Event readEvent(int num) {
		Event dto=null;
		
		try {
			dto=dao.getReadData("event.readEvent", num);
		} catch (Exception e) {
		}
		
		return dto;
	}
	
	@Override
	public int deleteEvent(int num, String imageFilename, String path) {
		int result=0;
		
		try {
			// 댓글, 좋아요/싫어요 는 ON DELETE CASCADE 로 자동 삭제
			
			if(imageFilename!=null)
				fileManager.doFileDelete(imageFilename, path);
			
			// 게시물지우기
			result=dao.deleteData("event.deleteEvent", num);
		} catch (Exception e) {
		}
		
		return result;
	}
	
	
	
	
	@Override
	public int updateEvent(Event dto, String path) {
		int result=0;
		
		try {
			// 업로드한 파일이 존재한 경우
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), path);
		
				if (newFilename != null) {
					// 이전 파일 지우기
					Event vo = readEvent(dto.getEvtNum());
					if(vo!=null && vo.getImageFilename()!=null) {
						fileManager.doFileDelete(vo.getImageFilename(), path);
					}
					
					dto.setImageFilename(newFilename);
				}
			}
			
			result=dao.updateData("event.updateEvent", dto);
		} catch (Exception e) {
		}
		
		return result;
	}


	
	
}
