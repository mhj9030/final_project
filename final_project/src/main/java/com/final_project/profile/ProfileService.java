package com.final_project.profile;

public interface ProfileService {
	
	public Profile profileRead(String mid);
	public void updateProfile(Profile dto, String pathname) throws Exception;
}
