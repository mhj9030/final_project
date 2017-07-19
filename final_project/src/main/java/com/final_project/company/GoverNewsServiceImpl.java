package com.final_project.company;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("company.goverNewsService")
public class GoverNewsServiceImpl implements GoverNewsService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result=dao.getIntValue("company.countGoverNews", map);
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public List<GoverNews> listGoverNews(Map<String, Object> map) throws Exception {
		List<GoverNews> list=null;
		
		try {
			list=dao.getListData("company.listGoverNews", map);
		} catch (Exception e) {
			throw e;
		}
		
		return list;
	}

	@Override
	public void insertGoverNews(GoverNews dto) throws Exception {
		try {
			dao.insertData("company.insertGoverNews", dto);
		} catch (Exception e) {
			
		}
		
	}

	@Override
	public void updateGnHitCount(int gnNum) throws Exception {
		try {
			dao.updateData("company.updateGnHitCount", gnNum);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public GoverNews readGoverNews(int gnNum) throws Exception {
		GoverNews dto=null;
		
		try {
			dto=dao.getReadData("company.readGoverNews", gnNum);
		} catch (Exception e) {
			throw e;
		}
		
		return dto;
	}

	@Override
	public GoverNews preReadGoverNews(Map<String, Object> map) throws Exception {
		GoverNews preDto=null;
		
		try {
			preDto=dao.getReadData("company.preReadGoverNews", map);
		} catch (Exception e) {
			throw e;
		}
		
		return preDto;
	}

	@Override
	public GoverNews nextReadGoverNews(Map<String, Object> map) throws Exception {
		GoverNews nextDto=null;
		
		try {
			nextDto=dao.getReadData("company.nextReadGoverNews", map);
		} catch (Exception e) {
			throw e;
		}
		
		return nextDto;
	}

	@Override
	public void updateGoverNews(GoverNews dto) throws Exception {
		try {
			dao.updateData("company.updateGoverNews", dto);
		} catch (Exception e) {
			throw e;
		}
	}
}
