package com.final_project.member;

import java.util.List;
import java.util.Map;

public interface MyInquiryService {
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<MyInquiry> listMyInquiry(Map<String, Object> map) throws Exception;
}
