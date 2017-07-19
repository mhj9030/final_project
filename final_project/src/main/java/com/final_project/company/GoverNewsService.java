package com.final_project.company;

import java.util.List;
import java.util.Map;

public interface GoverNewsService {
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<GoverNews> listGoverNews(Map<String, Object> map) throws Exception;
	public void insertGoverNews(GoverNews dto) throws Exception;
	public void updateGnHitCount(int gnNum) throws Exception;
	public GoverNews readGoverNews(int gnNum) throws Exception;
	public GoverNews preReadGoverNews(Map<String, Object> map) throws Exception;
	public GoverNews nextReadGoverNews(Map<String, Object> map) throws Exception;
}
