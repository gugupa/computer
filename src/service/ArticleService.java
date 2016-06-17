package service;

import java.util.List;

import model.Article;

public interface ArticleService {

	public boolean newArticle(Article model);
	public Article loadArticle (Integer id);
	public List<Article> listValidArticlesByPage(int page,int pagesize) ;
	public List<Article> searchArticleByKeyword(String keyString);
	public int querySize(String hql);

}
