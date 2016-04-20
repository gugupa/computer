package service;
import javax.annotation.Resource;



import org.springframework.stereotype.Service;

import model.User;
import dao.UserDao;;

@Service("UserService") 
public class UserServiceImpl implements UserService{

	@Resource(name="UserDao")
	UserDao dao;
	
	public UserDao getDao() {
		return dao;
	}

	public void setDao(UserDao dao) {
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
