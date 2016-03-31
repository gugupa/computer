package action;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import service.UserService;
import util.MD5;

import model.User;

@Controller(value="UserAction")  @Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	User user=new User();
	
	@Resource(name="UserService")
	UserService u_service;

	public User getModel(){
		return user;
	}

	public UserService getU_service() {
		return u_service;
	}
	
	public void setU_service(UserService uService) {
		u_service = uService;
	}


	//注册用户
	public String regUser(){
		//MD5加密
		String email=this.getModel().getUsername();
		/*查询昵称是否已经存在*/
		if(u_service.queryUser(email)!=null) 
		{
			this.addFieldError("username_existerror", getText("reguser_username_existerror"));
		}
		getModel().setPassword(MD5.calcMD5(getModel().getPassword()));
		u_service.regUser(getModel());
	    this.addActionMessage("注册成功！");//?
	    return "index";		
	}
	
	//登录
	public String login(){
		//MD5加密
		getModel().setPassword(MD5.calcMD5(getModel().getPassword()));

		User tempUser=u_service.login(getModel());
		if (tempUser!=null) {
			ServletActionContext.getRequest().getSession().setAttribute("user",tempUser);
			return "index";
		} else {
			addActionMessage("用户名或密码错误!");
		}
		return "input";
	}
	




}
