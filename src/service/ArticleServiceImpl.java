package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import model.Article;
import dao.ArticleDao;

@Service("ArticleService") 
public class ArticleServiceImpl implements ArticleService{
	
	@Resource(name="ArticleDao")
	ArticleDao dao;

	public ArticleDao getDao() {
		return dao;
	}

	public void setDao(ArticleDao dao) {
		this.dao = dao;
	}

	//添加一篇新文章
	public boolean newArticle(Article article) {
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
   
   //根据搜索关键字返回文章
   public List searchArticleByKeyword(String keyString)
	{
		try{
			String hql="from Article as a where (a.title like '%"+keyString+"%'  or a.acontent like '%"+keyString+"%' ) and a.state=1";
			return dao.query(hql);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

   //按页返回验证过的文章
	public List<Article> listValidArticlesByPage(int page,int pagesize) {
		try{
			String hql= "from Article as a where a.state='1'";
			return dao.queryListObjectAllForPage(hql,pagesize,page);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	//符合条件     罗列在resultList的文章共有多少篇
	public int querySize(String hql) {
		return dao.query(hql).size();
	}

   
}