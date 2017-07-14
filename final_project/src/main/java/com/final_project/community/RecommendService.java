package com.final_project.community;

import java.util.List;
import java.util.Map;

public interface RecommendService {
	public List<Recommend> listRecommend(Map<String, Object> map); //등록된 기업정보 가져오기
	public int dataCountCompany(Map<String, Object> map); // 등록된 모든기업 갯수
	public int dataCountGoodcom_total(); // 전체 등록된 추천갯수
	public int dataCountGoodcom(Map<String, Object> map); // 기업당 등록된 추천갯수
	public List<RecommendArticle> listRecommendArticle(Map<String, Object> map); //기업의 등록된 추천리스트
	public RecommendArticle RecommendArticleInfo(int cNum); // 기업의 추천의 대한 기본정보 가져오기
	public int dataCountEmploy(int cNum);
	public RecommendArticle readRecommendContent(int gcNum);
	
	
}
