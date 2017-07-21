package com.final_project.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;
@Service("member.ScrapService")
public class ScrapServiceImpl implements ScrapService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Scrap> listScrap(Map<String, Object> map) throws Exception {
		List<Scrap> list=null;
		
		try {
			list=dao.getListData("scrap.listScrap", map);
		} catch (Exception e) {
			throw e;
		}	
		return list;
	}
	
}
