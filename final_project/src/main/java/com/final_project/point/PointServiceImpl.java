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
		int result = 0;
		
		try {
			result = dao.getIntValue("point.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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
			System.out.println("mypoint: " + e.toString());
			e.printStackTrace();
		}
		
		point.setMypoint(mypoint);
		point.setReserve(reserve);
		
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

	@Override
	/** history-적립이유, point-포인트액수, mId-적립아이디 map으로 보내면 됨 */
	public int savaPoint(Map<String, Object> map) {
		int result = 0;
		
		try {
			map.put("classify", "적립");
			result = dao.insertData("point.savaPoint", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int usePoint(Map<String, Object> map) {
		int result = 0;
		
		try {
			map.put("classify", "사용");
			result = dao.insertData("point.usePoint", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}