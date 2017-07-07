package com.final_project.help;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("help.qaService")
public class QaServiceImpl implements QaService{
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertQa(Qa dto, String pathname) {
		int result=0;
		
		try {
			int seq=dao.getIntValue("qa.seq");
			dto.setQaNum(seq);
			
			if(pathname.equals("created")) {
				dto.setGroupNum(seq);
				
			} else if(pathname.equals("reply")) {
				// orderNo 변경
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("groupNum", dto.getGroupNum());
				map.put("orderNo", dto.getOrderNo());
				
				dao.updateData("qa.updateOrderNo", map);

				dto.setDepth(dto.getDepth() + 1);
				dto.setOrderNo(dto.getOrderNo() + 1);
			}
			
			result=dao.insertData("qa.insertQa", dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("qa.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public List<Qa> listQa(Map<String, Object> map) {
		List<Qa> list=null;
		
		try {
			list=dao.getListData("qa.listQa", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public Qa readQa(int qaNum) {
		Qa dto=null;
		
		try{
			dto=dao.getReadData("qa.readQa", qaNum);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public int updateHitCount(int qaNum) {
		int result=0;

		try{
			result=dao.updateData("qa.updateHitCount", qaNum);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public Qa preReadQa(Map<String, Object> map) {
		Qa dto=null;
		
		try{
			dto=dao.getReadData("qa.preReadQa", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;

	}

	@Override
	public Qa nextReadQa(Map<String, Object> map) {
		Qa dto=null;
		
		try{
			dto=dao.getReadData("qa.nextReadQa", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
}
