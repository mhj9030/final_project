package com.final_project.point;

import java.util.List;
import java.util.Map;

public interface MypointService {
	public Point mypoint(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Point> readlist(Map<String, Object> map) throws Exception;
}