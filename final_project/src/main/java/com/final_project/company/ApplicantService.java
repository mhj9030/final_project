package com.final_project.company;

import java.util.List;
import java.util.Map;

public interface ApplicantService {
	public List<Applicant> listApplicant(Map<String, Object> map) throws Exception;
	public int dataCount(int ceNum) throws Exception;
	public List<Employ> applicantListEmploy(String cSerial) throws Exception;
}
