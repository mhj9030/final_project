package com.final_project.member;

import java.util.ArrayList;
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
	public int insertOneDetails(MemberDetail dto, String pathname) {
		int result = 0;
		
		try {
			/*if(! dto.getUpload().isEmpty()){
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setrPhoto(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			*/
			dto.setrPhoto(pathname);
			result = dao.insertData("applications.insertDefault", dto);
			
			if(result!=0){
				result = dao.getIntValue("applications.newResume", dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
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
				result = dao.insertData("applications.deleteResume", dto);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int deleteList(List<MemberDetail> list) {
		int result = 0;
		
		try {
			for(MemberDetail dto:list)
				break;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
}
