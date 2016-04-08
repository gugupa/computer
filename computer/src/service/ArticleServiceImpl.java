package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.Article;
import dao.BaseDAO;

@Service("ArticleService") 
public class ArticleServiceImpl implements ArticleService{
	
	@Resource(name="BaseDAO")
	BaseDAO dao;

	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	//保存文章
	public boolean saveArticle(Article article) {
		try
		{
			dao.saveOrUpdate(article);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return true;
	}
	
   //根据id加载文章
	public Article loadArticle(Integer id) {
		try {
			return (Article)dao.loadById(Article.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
   //返回所有验证过的书籍
   public List<Article> listAllValidArticles() {
		try
		{
			return dao.query("from Article as a where a.state='1'");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
   
   //根据搜索关键字返回文章
   public List searchArticleByKeyword(String hql)
	{
		try{
			return dao.query(hql);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

   
}