package com.final_project.point;

import java.util.List;
import java.util.Map;

public interface MarketService {
	public List<Point> readList();
	public int use(Map<String, Object> map);
	public List<Point> readResume();
}