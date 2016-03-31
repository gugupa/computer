package dao;

import java.io.Serializable;
import java.util.List;

import model.Article;
import model.User;


public interface BaseDAO {
	
 public void  saveOrUpdate(Object object);
 public Object loadObject(String hql);
// public List<Article> QueryAllArticle();
 public Object loadById(Class clazz, Serializable id);
 public List query(String hql);
 
}

