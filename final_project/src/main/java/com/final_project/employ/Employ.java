package com.final_project.employ;

import java.sql.Date;

public class Employ {
//채용정보 상세검색
private int macode, subcode;
private String maname,subname;

//company 회사번호 회사명 회사사진
private String cSerial,cName,cLogoimage;
//employ_com 공고번호 제목 지원자격 근무조건 마감일등록일
private int ceNum;
private String ceSubject, ability, ceType,cePrefere;
private Date ceStart, ceEnd;
//sub_class
private int liCode;
private String license;




public String getSubname() {
	return subname;
}
public void setSubname(String subname) {
	this.subname = subname;
}
public String getCeSubject() {
	return ceSubject;
}
public void setCeSubject(String ceSubject) {
	this.ceSubject = ceSubject;
}
public String getLicense() {
	return license;
}
public void setLicense(String license) {
	this.license = license;
}




public String getCePrefere() {
	return cePrefere;
}
public void setCePrefere(String cePrefere) {
	this.cePrefere = cePrefere;
}
public int getLiCode() {
	return liCode;
}
public void setLiCode(int liCode) {
	this.liCode = liCode;
}

public String getcSerial() {
	return cSerial;
}
public void setcSerial(String cSerial) {
	this.cSerial = cSerial;
}
public String getcName() {
	return cName;
}
public void setcName(String cName) {
	this.cName = cName;
}
public String getcLogoimage() {
	return cLogoimage;
}
public void setcLogoimage(String cLogoimage) {
	this.cLogoimage = cLogoimage;
}
public int getCeNum() {
	return ceNum;
}
public void setCeNum(int ceNum) {
	this.ceNum = ceNum;
}

public String getAbility() {
	return ability;
}
public void setAbility(String ability) {
	this.ability = ability;
}
public String getCeType() {
	return ceType;
}
public void setCeType(String ceType) {
	this.ceType = ceType;
}
public Date getCeStart() {
	return ceStart;
}
public void setCeStart(Date ceStart) {
	this.ceStart = ceStart;
}
public Date getCeEnd() {
	return ceEnd;
}
public void setCeEnd(Date ceEnd) {
	this.ceEnd = ceEnd;
}
public int getMacode() {
	return macode;
}
public void setMacode(int macode) {
	this.macode = macode;
}
public int getSubcode() {
	return subcode;
}
public void setSubcode(int subcode) {
	this.subcode = subcode;
}
public String getManame() {
	return maname;
}
public void setManame(String maname) {
	this.maname = maname;
}


}