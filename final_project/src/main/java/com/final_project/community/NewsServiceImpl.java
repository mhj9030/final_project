package com.final_project.community;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.final_project.common.FileManager;
import com.final_project.common.dao.CommonDAO;

@Service("community.newsService")
public class NewsServiceImpl implements NewsService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public int insertNews(News dto, String pathname) {
		int result=0;
		try {
			if(! dto.getUpload().isEmpty()){
				String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			result = dao.insertData("community_news.insertNews", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<News> listNews(Map<String, Object> map) {
		List<News> list = null;
		
		try{
			list=dao.getListData("community_news.listNews",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0 ;
		
		try {
			result = dao.getIntValue("community_news.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public News readNews(int jbnum) {
		News dto = null;
		
		try {
			dto = dao.getReadData("community_news.readNews", jbnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int jbnum) {
		int result = 0;
		
		try {
			result = dao.updateData("community_news.updatehitCount", jbnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public News preReadNews(Map<String, Object> map) {
		News dto = null;
		try {
			dto = dao.getReadData("community_news.preReadNews", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public News nextReadNews(Map<String, Object> map) {
		News dto = null;
		try {
			dto = dao.getReadData("community_news.nextReadNews", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateNews(News dto, String pathname) {
		int result=0;

		try{
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
				if (newFilename != null) {
					// 이전 파일 지우기
					if(dto.getSaveFilename().length()!=0 && dto.getSaveFilename()!=null) {
						fileManager.doFileDelete(dto.getSaveFilename(), pathname);
					}
					
					dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
					dto.setSaveFilename(newFilename);
				}
			}
			
			result= dao.updateData("community_news.updateNews", dto);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteNews(int jbnum, String pathname, String mId) {
		int result = 0;
		
		try {
			News dto=readNews(jbnum);
			if(dto!=null) {
				if(! dto.getmId().equals(mId) && ! mId.equals("admin@a.com"))
					return result;
				
				if(dto.getSaveFilename()!=null&&dto.getSaveFilename().length()!=0) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			
			result = dao.deleteData("community_news.deleteNews", jbnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertLikeNews(News dto) {
		int result = 0;
		
		try {
			result = dao.insertData("community_news.insertLikeNews", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int countLikeNews(int jbnum) {
		int result = 0;
		
		try {
			result = dao.getIntValue("community_news.countLikeNews", jbnum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int insertReply(NewsReply dto) {
		int result = 0;
		
		try {
			result = dao.insertData("community_news.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<NewsReply> listReply(Map<String, Object> map) {
		List<NewsReply> list = null;
		
		try {
			list = dao.getListData("community_news.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<NewsReply> listReplyAnswer(int answer) {
		List<NewsReply> list=null;
		try {
			list=dao.getListData("community_news.listReplyAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.getIntValue("community_news.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int replyCountAnswer(int answer) {
		int result=0;
		try {
			result=dao.getIntValue("community_news.replyCountAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.deleteData("community_news.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
