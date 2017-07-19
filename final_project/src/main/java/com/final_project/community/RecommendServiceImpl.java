package com.final_project.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("community.recommendService")
public class RecommendServiceImpl implements RecommendService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Recommend> listRecommend(Map<String, Object> map) {
		List<Recommend> list = null;
		
		try {
			list = dao.getListData("community_recommend.listRecommend", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCountCompany(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("community_recommend.dataCount_company", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int dataCountGoodcom_total() {
		int result = 0;
		
		try {
			result = dao.getIntValue("community_recommend.dataCount_goodcom_total");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int dataCountGoodcom(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.getIntValue("community_recommend.dataCount_goodcom", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<RecommendArticle> listRecommendArticle(Map<String, Object> map) {
		List<RecommendArticle> list = null;
		
		try {
			list = dao.getListData("community_recommend.listRecommendArticle", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public RecommendArticle RecommendArticleInfo(int cNum) {
		RecommendArticle dto = null;
		
		try {
			dto = dao.getReadData("community_recommend.RecommendArticleInfo", cNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int dataCountEmploy(int cNum) {
		int result = 0;
		try {
			result = dao.getIntValue("community_recommend.dataCountEmploy", cNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public RecommendArticle readRecommendContent(int gcNum) {
		RecommendArticle dto = null;
		
		try {
			dto = dao.getReadData("community_recommend.readRecommendContent", gcNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int insertRecommend(RecommendArticle dto) {
		int result = 0;
		
		try {
			result = dao.insertData("community_recommend.insertRecommend", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int updateRecommend(RecommendArticle dto) {
		int result = 0;
		
		try {
			result = dao.updateData("community_recommend.updateRecommend", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int deleteRecommend(int gcNum) {
		int result = 0;
		
		try {
			result = dao.deleteData("community_recommend.deleteRecommend", gcNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
}
