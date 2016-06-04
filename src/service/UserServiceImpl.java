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

	/*用户登录*/
	public User login(String email_username,User user) {
		User rs=null;
		/*查询（昵称or用户名）*/
		String find="from User a where (a.username='"+email_username+"' or a.email='"+email_username+"') and a.password='"+user.getPassword()+"'";		
		System.out.println(find);
		rs=(User)dao.loadObject(find);
		return rs;
	}

	/*修改用户基本信息:邮箱 用户名 昵称*/
	public boolean editUser(User user){
		boolean status = false;
		try{
			System.out.println("editUser:"+user.getId());
			dao.saveOrUpdate(user);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}

	/*查询用户邮箱是否已经存在*/
	public User checkEmail(String email) {
		return (User) dao.loadObject("from User u where u.email='"+email+"'");
	}

	/*查询用户昵称是否已经存在*/
	public User checkUsername(String username) {
		return (User) dao.loadObject("from User u where u.username='"+username+"'");
	}
	
	
}
