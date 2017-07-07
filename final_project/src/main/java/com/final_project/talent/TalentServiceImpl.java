package com.final_project.talent;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("talent.talentService")
public class TalentServiceImpl implements TalentService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Talent> mainType() {
		List<Talent> mainType = null;
		
		try {
			mainType = dao.getListData("talent.mainClass");
		} catch (Exception e) {
			System.out.println(e.toString());
			//e.printStackTrace();
		}
		
		return mainType;
	}
	
	@Override
	public List<Talent> subType(Map<String, Object> map) {
		List<Talent> list = new ArrayList<>();
		
		try {
			list = dao.getListData("talent.subClass", map);
		} catch (Exception e) {
			System.out.println(e.toString());
			//e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Talent> listBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Talent> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Talent readList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
}