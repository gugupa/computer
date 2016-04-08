package service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BaseDAO;

@Service("CommentService") 
public class CommentServiceImpl implements CommentService{
	
	@Resource(name="BaseDAO")
    BaseDAO dao;
    public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}
}
