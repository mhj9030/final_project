package com.final_project.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberDetail {
	private String rownum, rNum, rName, engName, phone, eMail, addr, addr2, army, apply, pay, mId, endWrite, rPhoto;
	private MultipartFile upload;
	// 자기소개
	private String intro1, intro2, intro3, intro4;
	// 학교
	private String termStart, termEnd, termState, school, major;
	// 경력
	private String mcNum, company, part, carStart, carEnd, memo;
	// 프로젝트
	private String prNum, prName, expStartYear, expStartMonth, expEndYear, expEndMonth, expState;
	// 자격증
	private String liNum, license, expStart, expEnd, liGC;
	// 언어
	private String laNum, language, laScore;
	// 수상
	private String awNum, awAgency, awSector, awDate;//, memo;
	//
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getrNum() {
		return rNum;
	}
	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getEngName() {
		return engName;
	}
	public void setEngName(String engName) {
		this.engName = engName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getArmy() {
		return army;
	}
	public void setArmy(String army) {
		this.army = army;
	}
	public String getApply() {
		return apply;
	}
	public void setApply(String apply) {
		this.apply = apply;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getEndWrite() {
		return endWrite;
	}
	public void setEndWrite(String endWrite) {
		this.endWrite = endWrite;
	}
	public String getrPhoto() {
		return rPhoto;
	}
	public void setrPhoto(String rPhoto) {
		this.rPhoto = rPhoto;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getIntro1() {
		return intro1;
	}
	public void setIntro1(String intro1) {
		this.intro1 = intro1;
	}
	public String getIntro2() {
		return intro2;
	}
	public void setIntro2(String intro2) {
		this.intro2 = intro2;
	}
	public String getIntro3() {
		return intro3;
	}
	public void setIntro3(String intro3) {
		this.intro3 = intro3;
	}
	public String getIntro4() {
		return intro4;
	}
	public void setIntro4(String intro4) {
		this.intro4 = intro4;
	}
	public String getTermStart() {
		return termStart;
	}
	public void setTermStart(String termStart) {
		this.termStart = termStart;
	}
	public String getTermEnd() {
		return termEnd;
	}
	public void setTermEnd(String termEnd) {
		this.termEnd = termEnd;
	}
	public String getTermState() {
		return termState;
	}
	public void setTermState(String termState) {
		this.termState = termState;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getMcNum() {
		return mcNum;
	}
	public void setMcNum(String mcNum) {
		this.mcNum = mcNum;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getCarStart() {
		return carStart;
	}
	public void setCarStart(String carStart) {
		this.carStart = carStart;
	}
	public String getCarEnd() {
		return carEnd;
	}
	public void setCarEnd(String carEnd) {
		this.carEnd = carEnd;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getPrNum() {
		return prNum;
	}
	public void setPrNum(String prNum) {
		this.prNum = prNum;
	}
	public String getPrName() {
		return prName;
	}
	public void setPrName(String prName) {
		this.prName = prName;
	}
	public String getExpStartYear() {
		return expStartYear;
	}
	public void setExpStartYear(String expStartYear) {
		this.expStartYear = expStartYear;
	}
	public String getExpStartMonth() {
		return expStartMonth;
	}
	public void setExpStartMonth(String expStartMonth) {
		this.expStartMonth = expStartMonth;
	}
	public String getExpEndYear() {
		return expEndYear;
	}
	public void setExpEndYear(String expEndYear) {
		this.expEndYear = expEndYear;
	}
	public String getExpEndMonth() {
		return expEndMonth;
	}
	public void setExpEndMonth(String expEndMonth) {
		this.expEndMonth = expEndMonth;
	}
	public String getExpState() {
		return expState;
	}
	public void setExpState(String expState) {
		this.expState = expState;
	}
	public String getLiNum() {
		return liNum;
	}
	public void setLiNum(String liNum) {
		this.liNum = liNum;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getExpStart() {
		return expStart;
	}
	public void setExpStart(String expStart) {
		this.expStart = expStart;
	}
	public String getExpEnd() {
		return expEnd;
	}
	public void setExpEnd(String expEnd) {
		this.expEnd = expEnd;
	}
	public String getLiGC() {
		return liGC;
	}
	public void setLiGC(String liGC) {
		this.liGC = liGC;
	}
	public String getLaNum() {
		return laNum;
	}
	public void setLaNum(String laNum) {
		this.laNum = laNum;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getLaScore() {
		return laScore;
	}
	public void setLaScore(String laScore) {
		this.laScore = laScore;
	}
	public String getAwNum() {
		return awNum;
	}
	public void setAwNum(String awNum) {
		this.awNum = awNum;
	}
	public String getAwAgency() {
		return awAgency;
	}
	public void setAwAgency(String awAgency) {
		this.awAgency = awAgency;
	}
	public String getAwSector() {
		return awSector;
	}
	public void setAwSector(String awSector) {
		this.awSector = awSector;
	}
	public String getAwDate() {
		return awDate;
	}
	public void setAwDate(String awDate) {
		this.awDate = awDate;
	}
}