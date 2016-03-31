package service;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;


import model.Article;
import model.User;
import dao.BaseDAO;
@Service("UserService") 
public class UserServiceImpl implements UserService{

	@Resource(name="BaseDAO")
	BaseDAO dao;
	
	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	public boolean regUser(User user) {
		
		boolean status = false;
		try{
			dao.saveOrUpdate(user);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}

	public User login(User user) {
		return (User)dao.loadObject("from User a where a.email='"+user.getEmail()+"' and a.password='"+user.getPassword()+"'");
	}
	
	/*查询该邮箱是否已经存在*/
	public User queryUser(String email) {
		return (User) dao.loadObject("from User a where a.email='"+email+"'");
	}
	
	
}
