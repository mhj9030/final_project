package com.final_project.setting;

public interface SettingService {
	
	public int insertCareer(Career dto);
	public int insertAbility(Ability dto);
	
	public int insertExpertise(Expertise dto);
	public int updateExpertise(Expertise dto);
	
	public int insertProject(Project dto);

}
