package com.final_project.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service("member.applicationService")
public class ApplicationServiceImpl implements ApplicationService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	// 보기
	@Override
	public int listCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("applications.resumeCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public List<MemberDetail> list(Map<String, Object> map) {
		List<MemberDetail> list = new ArrayList<>();
		
		try {
			list = dao.getListData("applications.resumeList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public Member memberList(Map<String, Object> map) {
		Member dto = new Member();
		
		try {
			dto = dao.getReadData("applications.memberList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public List<MemberDetail> academyList(Map<String, Object> map) {
		List<MemberDetail> list = new ArrayList<>();
		
		try {
			list = dao.getListData("applications.academyList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<MemberDetail> projectList(Map<String, Object> map) {
		List<MemberDetail> list = new ArrayList<>();
		
		try {
			list = dao.getListData("applications.projectList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}
	
	@Override
	public List<MemberDetail> careerList(Map<String, Object> map) {
		List<MemberDetail> list = new ArrayList<>();
		
		try {
			list = dao.getListData("applications.careerList", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int insertOneDetails(MemberDetail dto) {
		int result = 0;
		
		try {
			result = dao.insertData("applications.insertDefault", dto);
			
			if(result!=0){
				result = dao.getIntValue("applications.newResume", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(">>> " + result);
		return result;
	}

	@Override
	public int insertOneCareer(List<MemberDetail> list, Map<String, Object> map) {
		int result = 0;
		try {
			for(MemberDetail dto:list){
				map.put("mcNum", dto.getMcNum());
				result = dao.insertData("applications.resCare", map);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertOneProject(List<MemberDetail> list, Map<String, Object> map) {
		int result = 0;
		
		try {
			for(MemberDetail dto:list){
				map.put("prNum", dto.getPrNum());
				result = dao.insertData("applications.resProj", map);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	

	@Override
	public MemberDetail readResume(Map<String, Object> map) {
		MemberDetail dto = new MemberDetail();
		
		try {
			dto = dao.getReadData("applications.readResume", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int delete(List<String> list) {
		int result = 0;
		
		try {
			for(String dto:list){
				Map<String, Object> map = new HashMap<>();
				map.put("rNum", Integer.parseInt(dto));
				result = dao.insertData("applications.deleteResume2", map);
				result = dao.insertData("applications.deleteResume3", map);
				result = dao.insertData("applications.deleteResume4", map);
				result = dao.insertData("applications.deleteResume5", map);
				result = dao.insertData("applications.deleteResume6", map);
				result = dao.insertData("applications.deleteResume7", map);
				result = dao.insertData("applications.deleteResume1", map);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int updateDefault(MemberDetail dto) {
		int result = 0;
		
		try {
			result = dao.updateData("applications.updateDefault", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public MemberDetail selectThrIntro(Map<String, Object> map) {
		MemberDetail dto = new MemberDetail();
		
		try {
			dto = dao.getReadData("applications.selectThrIntro", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public int insertThrIntro(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.updateData("applications.insertThrIntro", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public int updateThrIntro(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("applications.updateThrIntroCheck", map);
			if(result==0)
				result = dao.insertData("applications.insertThrIntro", map);
			else
				result = dao.updateData("applications.updateThrIntro", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
}