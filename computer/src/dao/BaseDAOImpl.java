﻿ package dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;


import model.Article;
	
@Repository(value="BaseDAO")
public class BaseDAOImpl extends HibernateDaoSupport implements BaseDAO{
	
//	SessionFactory factory;
	
//	查询所有文章
//	public ArrayList<Article> QueryAllArticle() {
//	        Session s = factory.getCurrentSession();
//	        String hql = "From Article where a.state!='0'";
//	        Query q = s.createQuery(hql);
//	        List articleList = q.list();
//	        return (ArrayList<Article>) articleList;
//	}
	
//	保存或更新对象
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
		return getHibernateTemplate().find(hql);
	}

	@Autowired  
    public void setSessionFactoryOverride(SessionFactory sessionFactory)   
    {   
  
        super.setSessionFactory(sessionFactory);   
    }  
	

}
