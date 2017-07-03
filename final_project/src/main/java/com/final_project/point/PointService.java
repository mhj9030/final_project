package com.final_project.point;

import java.util.List;
import java.util.Map;

public interface PointService {
	// pointboard
	public List<Point> readBoardList(Map<String, Object> map);
	public int dataCount();
	public Point readBoard(Map<String, Object> map);
	public int insertBoard(Point dto);
	public int updateBoard(Point dto);
	public int deleteBoard(Map<String, Object> map);
	
	
	// mypoint
	public Point mypoint(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<Point> readlist(Map<String, Object> map);
}