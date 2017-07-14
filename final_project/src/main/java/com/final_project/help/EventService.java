package com.final_project.help;

import java.util.List;
import java.util.Map;

public interface EventService {
	public int insertEvent(Event dto, String path);
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	/*public Photo readPhoto(int num);
	public Photo preReadPhoto(Map<String, Object> map);
	public Photo nextReadPhoto(Map<String, Object> map);
	public int updatePhoto(Photo dto, String path);
	public int deletePhoto(int num, String imageFilename, String path);
*/	
	
}
