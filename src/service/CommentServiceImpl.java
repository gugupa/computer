package service;

import java.util.List;

import javax.annotation.Resource;

import model.Comment;

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

	
	//根据指定文章id返回相应的评论
	public List<Comment> listAllValidComments(Integer articleId) {
		String hql="from Comment as c where c.articleId="+articleId;
		return dao.query(hql);
	}

	//在这里保存一条新的评论记录
	public boolean saveComment(Comment comment) {
		try{
			dao.saveOrUpdate(comment);
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}

	//在这里根据id加载评论
	public Comment loadComment(int id) {
		return (Comment) dao.loadById(Comment.class, id);
	}

}
