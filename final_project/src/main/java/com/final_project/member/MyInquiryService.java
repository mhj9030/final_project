package com.final_project.member;

import java.util.List;
import java.util.Map;

public interface MyInquiryService {
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<MyInquiry> listMyInquiry(Map<String, Object> map) throws Exception;
	public MyInquiry readMyInquiry(int cqNum) throws Exception;
	public MyInquiry preReadMyInquiry(Map<String, Object> map) throws Exception;
	public MyInquiry nextReadMyInquiry(Map<String, Object> map) throws Exception;
	public void deleteMyInquiry(int cqNum) throws Exception;
	public void updateMyInquiry(MyInquiry dto) throws Exception;
}
