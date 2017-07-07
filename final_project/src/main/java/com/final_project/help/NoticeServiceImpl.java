package com.final_project.help;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("help.noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertNotice(Notice dto, String pathname) {
		int result=0;
		
		try {
			result=dao.insertData("notice.insertNotice", dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list=null;
		
		try{
			list=dao.getListData("notice.listNotice", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.getIntValue("notice.dataCount", map);			
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public Notice readNotice(int num) {
		Notice dto=null;
		
		try{
			// 게시물 가져오기
			dto=dao.getReadData("notice.readNotice", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;

		try{
			result=dao.updateData("notice.updateHitCount", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public int updateNotice(Notice dto, String pathname) {
		int result=0;

		try{
		
			dao.updateData("notice.updateNotice", dto);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteNotice(int num, String pathname, String mId) {
		int result=0;

		try{
			Notice dto=readNotice(num);
			if(dto!=null) {
				if(! dto.getmId().equals(mId) && ! mId.equals("admin@a.com"))
					return result;
				
			}
			
			// 댓글, 좋아요/싫어요 는 ON DELETE CASCADE 로 자동 삭제
			
			dao.deleteData("notice.deleteNotice", num);
			result=1;
		} catch(Exception e) {
		}
		return result;
	}
	
	
	
}