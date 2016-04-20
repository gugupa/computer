package dao;

import java.io.Serializable;
import java.util.List;

public interface CommentDao {

	 public void  saveOrUpdate(Object object);
	 public Object loadObject(String hql);
	 public Object loadById(Class clazz, Serializable id);
	 public List query(String hql);
}
