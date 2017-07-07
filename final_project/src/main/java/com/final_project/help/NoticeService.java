package com.final_project.help;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	public int insertNotice(Notice dto, String pathname);
	public List<Notice> listNotice(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Notice readNotice(int num);
	public int updateHitCount(int num);
	
	public int updateNotice(Notice dto, String pathname);
	//public int deleteNotice(int num, String pathname, String userId);
	public int deleteNotice(Map<String, Object> map);
}
