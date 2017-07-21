package com.final_project.member;

import java.util.List;
import java.util.Map;

public interface ScrapService {
	public List<Scrap> listScrap(Map<String, Object> map) throws Exception;
	public int deleteScrap(Map<String, Object> map) throws Exception;
}
