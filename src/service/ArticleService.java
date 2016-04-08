package service;

import java.util.List;

import model.Article;

public interface ArticleService {

	public boolean saveArticle(Article model);
	public Article loadArticle (Integer id);
	public List<Article> listAllValidArticles() ;
	public List<Article> searchArticleByKeyword(String hql);

}
