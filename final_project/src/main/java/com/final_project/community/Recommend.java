package com.final_project.community;

public class Recommend {
	private int gcNum, cNum, gcCount, employCount;
	private String subject, content, ccreated, cLogoImage, cName;
	private double grade;
	
	public int getEmployCount() {
		return employCount;
	}
	public void setEmployCount(int employCount) {
		this.employCount = employCount;
	}
	
	public int getGcCount() {
		return gcCount;
	}
	public void setGcCount(int gcCount) {
		this.gcCount = gcCount;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcLogoImage() {
		return cLogoImage;
	}
	public void setcLogoImage(String cLogoImage) {
		this.cLogoImage = cLogoImage;
	}
	public int getGcNum() {
		return gcNum;
	}
	public void setGcNum(int gcNum) {
		this.gcNum = gcNum;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCcreated() {
		return ccreated;
	}
	public void setCcreated(String ccreated) {
		this.ccreated = ccreated;
	}
}
