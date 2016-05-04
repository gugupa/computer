package service;

import java.util.List;

import model.Article;
import model.Comment;

import org.springframework.stereotype.Service;


public interface CommentService {
	
	public boolean saveComment(Comment comment);
	public List<Comment> listAllValidComments(Integer articleId);
	public Comment loadComment(int id);
}
