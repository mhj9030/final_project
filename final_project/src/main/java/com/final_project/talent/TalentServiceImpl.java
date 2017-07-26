package com.final_project.talent;

import java.util.ArrayList;
import java.util.HashMap;
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
			e.printStackTrace();
		}
		
		return mainType;
	}
	
	@Override
	public List<Talent> subType(Map<String, Object> map) {
		List<Talent> list = new ArrayList<>();
		
		try {
			list = dao.getListData("talent.subClass", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount() {
		int result = 0;
		
		try {
			result = dao.getIntValue("talent.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Talent> listBoard(Map<String, Object> map) {
		List<Talent> list = new ArrayList<>();
		
		try {
			System.out.println(map.get("mainCode"));
			list = dao.getListData("talent.searchList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Talent> interestList(List<Talent> list) {
		try {
			for(Talent dto:list){
				Map<String, Object> map = new HashMap<>();
				map.put("mId", dto.getmId());
				map.put("rNum", dto.getrNum());
				Talent jobs = dao.getReadData("talent.searchSub", map);
				dto.setSubTypes(jobs.getSubTypes());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("talent.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Talent readIntro(Map<String, Object> map) {
		Talent dto = null;
		
		try {
			dto = dao.getReadData("talent.readIntro", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Talent> readAbility(Map<String, Object> map) {
		List<Talent> list = null;
		
		try {
			list = dao.getListData("talent.readAbility", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Talent> readLicense(Map<String, Object> map) {
		List<Talent> list = null;
		
		try {
			list = dao.getListData("talent.readLicense", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Talent> readLanguage(Map<String, Object> map) {
		List<Talent> list = null;
		
		try {
			list = dao.getListData("talent.readLanguage", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<Talent> readProject(Map<String, Object> map) {
		List<Talent> list = null;
		
		try {
			list = dao.getListData("talent.readProject", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Talent> readAward(Map<String, Object> map) {
		List<Talent> list = null;
		
		try {
			list = dao.getListData("talent.readAward", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Talent> readCareer(Map<String, Object> map) {
		List<Talent> list = null;
		
		try {
			list = dao.getListData("talent.readCareer", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int storagyDataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("talent.storagyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<Talent> storagyResume(Map<String, Object> map) {
		List<Talent> list = new ArrayList<>();
		
		try {
			list = dao.getListData("talent.storagyResume", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Talent> isBuy(List<Talent> list, Map<String, Object> map) {
		try {
			for(Talent dto:list){
				Map<String, Object> qMap = new HashMap<>();
				qMap.put("mId", map.get("mId"));
				qMap.put("rNum", dto.getrNum());
				int result = dao.getIntValue("talent.isBuy", qMap);
				dto.setIsBuy(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insertInterest(List<String> list, Map<String, Object> map) {
		int result = 0;
		
		try {
			for(String s:list){
				map.put("subCode", s);
				result = dao.insertData("talent.insertInterest", map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}