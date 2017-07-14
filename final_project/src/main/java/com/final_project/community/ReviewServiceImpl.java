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
	public List<Review> listReviewLike(Map<String, Object> map) {
		List<Review> list = null;
		
		try {
			list = dao.getListData("community_review.listReviewLike", map);
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
		Review dto = null;
		
		try {
			dto = dao.getReadData("community_review.readReview", ibnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int ibnum) {
		int result = 0;
		
		try {
			result = dao.updateData("community_review.updatehitCount", ibnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Review preReadReview(Map<String, Object> map) {
		Review dto = null;
		
		try {
			dto = dao.getReadData("community_review.preReadReview", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public Review nextReadReview(Map<String, Object> map) {
		Review dto = null;
		
		try {
			dto = dao.getReadData("community_review.nextReadReview", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateReview(Review dto) {
		int result=0;

		try{
			result= dao.updateData("community_review.updateReview", dto);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReview(int ibnum) {
		int result = 0;
		
		try {
			result = dao.deleteData("community_review.deleteReview", ibnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertLikeReview(Review dto) {
		int result = 0;
		try {
			result = dao.insertData("community_review.insertLikeReview", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int countLikeReview(int ibnum) {
		int result = 0;
		try {
			result = dao.getIntValue("community_review.countLikeReview", ibnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReply(ReviewReply dto) {
		int result = 0;
		
		try {
			result = dao.insertData("community_review.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<ReviewReply> listReply(Map<String, Object> map) {
		List<ReviewReply> list = null;
		
		try {
			list = dao.getListData("community_review.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<ReviewReply> listReplyAnswer(int answer) {
		List<ReviewReply> list=null;
		try {
			list=dao.getListData("community_review.listReplyAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("community_review.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int replyCountAnswer(int answer) {
		int result=0;
		try {
			result=dao.getIntValue("community_review.replyCountAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("community_review.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
