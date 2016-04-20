package service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.CommentDao;

@Service("CommentService") 
public class CommentServiceImpl implements CommentService{
	
	@Resource(name="CommentDao")
    CommentDao dao;
    public CommentDao getDao() {
		return dao;
	}

	public void setDao(CommentDao dao) {
		this.dao = dao;
	}
}
