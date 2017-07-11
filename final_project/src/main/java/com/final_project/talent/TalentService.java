package com.final_project.talent;

import java.util.List;
import java.util.Map;

public interface TalentService {
	// 대분류 읽어오기
	public List<Talent> mainType();
	// 소분류 읽어오기
	public List<Talent> subType(Map<String, Object> map);
	// 일반 리스트
	public int dataCount();
	// 검색용
	public int dataCount(Map<String, Object> map);
	public List<Talent> listBoard(Map<String, Object> map);
	//
	public List<Talent> interestList(List<Talent> list);
	// 게시물 보기
	public Talent readIntro(Map<String, Object> map);
	public List<Talent> readAbility(Map<String, Object> map);
	public List<Talent> readLicense(Map<String, Object> map);
	public List<Talent> readLanguage(Map<String, Object> map);
	public List<Talent> readProject(Map<String, Object> map);
	public List<Talent> readAward(Map<String, Object> map);
	public List<Talent> readCareer(Map<String, Object> map);
}