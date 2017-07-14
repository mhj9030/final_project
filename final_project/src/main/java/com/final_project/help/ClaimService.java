package com.final_project.help;

import java.util.List;
import java.util.Map;

public interface ClaimService {
	public int insertClaim(Claim dto, String pathname);
	public List<Claim> listClaim(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Claim readClaim(int num);
	public int updateHitCount(int num);
	public Claim preReadClaim(Map<String, Object> map);
	public Claim nextReadClaim(Map<String, Object> map);
	public int updateClaim(Claim dto);
	public int deleteClaim(Map<String, Object> map);
	
	public int replyDataCount(Map<String, Object> map);
	public int insertReply(ClaimReply dto);
	public List<ClaimReply>listReply(Map<String, Object> map);
	
}
