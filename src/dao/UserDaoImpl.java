package dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

@Repository(value="UserDao")
public class UserDaoImpl extends HibernateDaoSupport implements UserDao{

//	保存或更新用户
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
