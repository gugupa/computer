package dao;

import java.io.Serializable;
import java.util.List;

import model.Article;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

@Repository(value="ArticleDao")
public class ArticleDaoImpl extends HibernateDaoSupport implements ArticleDao{
	
//	SessionFactory factory;
	
//	查询所有文章
//	public ArrayList<Article> QueryAllArticle() {
//	        Session s = factory.getCurrentSession();
//	        String hql = "From Article where a.state!='0'";
//	        Query q = s.createQuery(hql);
//	        List articleList = q.list();
//	        return (ArrayList<Article>) articleList;
//	}
	
//	保存或更新文章
	public void saveOrUpdate(Object object) {
		getHibernateTemplate().saveOrUpdate(object);	
	}

	public Object loadObject(String hql) {
		Object object=null;
		List list=getHibernateTemplate().find(hql);
		if (list.size()>0) {
			object=list.get(0);
		}
		return object;
	}

	public Object loadById(Class clazz, Serializable id) {	
		return  getHibernateTemplate().get(clazz, id);
	}

	/** 查询指定类的满足条件的持久化对象 */
	public List query(String hql) {
		System.out.println(hql);
		return getHibernateTemplate().find(hql);
	}

	@Autowired  
    public void setSessionFactoryOverride(SessionFactory sessionFactory)   
    {   
  
        super.setSessionFactory(sessionFactory);   
    }
	
//
//	public List<Article> queryListObjectAllForPage() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	public List<Article> queryListObjectAllForPage(String queryString,int pageSize,int page) {
		Session session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query query = session.createQuery(queryString);
		query.setFirstResult((page-1)*pageSize);
		query.setMaxResults(pageSize);
		List<Article> list= (List<Article>)query.list();
		session.close();
		return list;
	}

	public List<Article> queryListObjectAllForPage() {
		// TODO Auto-generated method stub
		return null;
	}  

}
