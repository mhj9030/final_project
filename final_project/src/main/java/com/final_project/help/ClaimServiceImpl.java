package com.final_project.help;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("help.claimService")
public class ClaimServiceImpl implements ClaimService{
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertClaim(Claim dto, String pathname) {
		int result=0;
		
		try {
			result=dao.insertData("claim.insertClaim", dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("claim.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public List<Claim> listClaim(Map<String, Object> map) {
		List<Claim> list=null;
		
		try {
			list=dao.getListData("claim.listClaim", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public Claim readClaim(int num) {
		Claim dto=null;
		
		try{
			dto=dao.getReadData("claim.readClaim", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public int updateHitCount(int num) {
		int result=0;

		try{
			result=dao.updateData("claim.updateHitCount", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public Claim preReadClaim(Map<String, Object> map) {
		Claim dto=null;
		
		try{
			dto=dao.getReadData("claim.preReadClaim", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;

	}

	@Override
	public Claim nextReadClaim(Map<String, Object> map) {
		Claim dto=null;
		
		try{
			dto=dao.getReadData("claim.nextReadClaim", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	

	
	@Override
	public int deleteClaim(Map<String, Object> map) {
			int result = 0;
		
		try {
			result = dao.getIntValue("claim.deleteClaim", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@Override
	public int updateClaim(Claim dto) {
		int result = 0;
		
		try {
			result = dao.updateData("claim.updateClaim", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@Override
	public int insertReply(ClaimReply dto) {
		int result=0;
		try {
			result=dao.insertData("claim.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public List<ClaimReply> listReply(Map<String, Object> map) {
		List<ClaimReply> list=null;
		try {
			list=dao.getListData("claim.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("claim.replyDataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	
}
