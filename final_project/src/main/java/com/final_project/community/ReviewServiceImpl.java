package com.final_project.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.dao.CommonDAO;

@Service("community.reviewService")
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertReview(Review dto) {
		int result = 0;
		
		try {
			result = dao.insertData("community_review.insertReview", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) {
		List<Review> list = null;
		
		try{
			list=dao.getListData("community_review.listReview",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0 ;
		
		try {
			result = dao.getIntValue("community_review.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Review readReview(int ibnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHitCount(int ibnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Review preReadReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Review nextReadReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReview(Review dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int ibnum, String mId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLikeReview(Review dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countLikeReview(int ibnum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReply(ReviewReply dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewReply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReviewReply> listReplyAnswer(int answer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyCountAnswer(int answer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
