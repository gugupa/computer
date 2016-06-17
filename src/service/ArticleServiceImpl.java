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

	//���һƪ������
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
	
   //����id��������
	public Article loadArticle(Integer id) {
		try {
			return (Article)dao.loadById(Article.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
   
   //���������ؼ��ַ�������
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

   //��ҳ������֤��������
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

	//��������     ������resultList�����¹��ж���ƪ
	public int querySize(String hql) {
		return dao.query(hql).size();
	}

   
}