package com.final_project.company;

import java.util.List;
import java.util.Map;

public interface InquiryService {
	public void insertInquiry(Inquiry dto) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Inquiry> listInquiry(Map<String, Object> map) throws Exception;
	public Inquiry readInquiry(int cqNum) throws Exception;
	public void insertAnswerInquiry(Inquiry dto) throws Exception;
}
