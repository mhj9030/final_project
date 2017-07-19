package com.final_project.help;

import java.util.List;
import java.util.Map;

public interface EventService {
	public int insertEvent(Event dto, String path);
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	public Event readEvent(int num);
	public int deleteEvent(int num, String imageFilename, String path);
	public int updateEvent(Event dto, String path);
/*
	public Photo preReadPhoto(Map<String, Object> map);
	public Photo nextReadPhoto(Map<String, Object> map);
*/	
	
}
