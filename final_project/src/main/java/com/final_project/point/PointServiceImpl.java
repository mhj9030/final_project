package com.final_project.point;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("point.pointService")
public class PointServiceImpl implements PointService{
	@Autowired
	private CommonDAO dao;
	
	// intro
	@Override
	public int dataCount() {
		int result = 0;
		
		try {
			result = dao.getIntValue("point.bbsDataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<Point> readBoardList(Map<String, Object> map) {
		List<Point> list = new ArrayList<>();
		
		try {
			list = dao.getListData("point.selectBbsList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public Point readBoard(Map<String, Object> map) {
		Point point = null;
		
		try {
			point = dao.getReadData("point.readBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return point;
	}
	
	@Override
	public int insertBoard(Point dto) {
		int result = 0;
		
		try {
			result = dao.insertData("point.insertBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int updateBoard(Point dto) {
		int result = 0;
		
		try {
			result = dao.updateData("point.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int deleteBoard(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("point.deleteBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// mypoint
	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Point mypoint(Map<String, Object> map) {
		Point point = new Point();
		int mypoint = 0;
		int reserve = 0;
		
		try {
			mypoint = dao.getIntValue("point.selectMypoint", map);
			reserve = dao.getIntValue("point.selectReserve", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int terminate = 0;
		
		point.setMypoint(mypoint);
		point.setReserve(reserve);
		point.setTerminate(terminate);
		
		return point;
	}
	
	@Override
	public List<Point> readlist(Map<String, Object> map) {
		List<Point> list = null;
		
		try {
			list = dao.getListData("point.selectPointList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}