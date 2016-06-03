package dao;

import java.io.Serializable;
import java.util.List;

import model.Article;

public interface ArticleDao {

	 public void  saveOrUpdate(Object object);
	 public Object loadObject(String hql);
	 //按页查询显示文章
	 public List<Article> queryListObjectAllForPage(String queryString,int pageSize,int page);
	 public Object loadById(Class clazz, Serializable id);
	 public List query(String hql);
}
