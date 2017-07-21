package com.final_project.help;

import java.util.List;
import java.util.Map;

public interface QaService {
	public int insertQa(Qa dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Qa> listQa(Map<String, Object> map);
	public Qa readQa(int num);
	public int updateHitCount(int num);
}
