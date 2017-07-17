package com.final_project.setting;

public class Career {

	// 경력 부분
	private String company; // 회사
	private String part; // 맡은 역활
	private String carstart; // 입사일
	private String carend; // 퇴사일 (재직중 있음)
	private String memo; // 간단메모
	private String mid; // 사용자 아이디
	
	
	
	

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



	public String getCarstart() {
		return carstart;
	}

	public void setCarstart(String carstart) {
		this.carstart = carstart;
	}

	public String getCarend() {
		return carend;
	}

	public void setCarend(String carend) {
		this.carend = carend;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

}
