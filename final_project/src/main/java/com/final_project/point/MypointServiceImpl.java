package com.final_project.point;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("point.mypointService")
public class MypointServiceImpl implements MypointService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public Point mypoint(Map<String, Object> map) throws Exception {
		Point point = new Point();
		
		int mypoint = dao.getIntValue("point.selectMypoint", map);
		int reserve = dao.getIntValue("point.selectReserve", map);
		int terminate = 0;
		
		point.setMypoint(mypoint);
		point.setReserve(reserve);
		point.setTerminate(terminate);
		
		return point;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int dataCount = dao.getIntValue("point.selectMypoint", map);
		return dataCount;
	}
	
	@Override
	public List<Point> readlist(Map<String, Object> map) throws Exception {
		List<Point> list = null;
		
		list = dao.getListData("point.selectPointList", map);
		
		return list;
	}

}