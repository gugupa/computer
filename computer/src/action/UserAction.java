package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.org.apache.bcel.internal.generic.NEW;

import service.UserService;
import util.MD5;

import model.User;

@Controller(value="UserAction")  @Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	User user=new User();
	File img;
	String imgContentType;
	String imgFileName;
	
	
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

	public String getImgContentType() {
		return imgContentType;
	}

	public void setImgContentType(String imgContentType) {
		this.imgContentType = imgContentType;
	}


	//注册用户
	public String regUser() throws Exception{
		//MD5加密
		getModel().setPassword(MD5.calcMD5(getModel().getPassword()));
		
		
		/*查询昵称是否已经存在*/
		String  email=this.getModel().getUsername();
		if(u_service.queryUser(email)!=null) 
		{
			this.addFieldError("username_existerror", getText("reguser_username_existerror"));
		}
		
		//处理头像上传
		String path = ServletActionContext.getServletContext().getRealPath("/upload");
		
		if (img!=null) {
			try {
				InputStream is =new FileInputStream(img);
				String fileContentType=this.getImgContentType();
				if (fileContentType.equals("image/jpeg")||fileContentType.equals("image/pjpeg")) {
					//生成随机地址？
					imgFileName=UUID.randomUUID().toString()+".jpg";
				} else if(fileContentType.equals("image/gif")){
                    imgFileName=UUID.randomUUID().toString()+".gif";
				}else if (fileContentType.equals("image/png")) {
					imgFileName=UUID.randomUUID().toString()+".png";
				}
				File file=new File(path,imgFileName);
				OutputStream os =new FileOutputStream(file);
				byte[] b =new byte[1024];
				int bs =0;
				while((bs=is.read(b))>0){
					os.write(b,0,bs);
				}
				is.close();
				os.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		if (img!=null) {
			getModel().setImg("upload/"+imgFileName);
		} else {
			getModel().setImg("upload/NoImage.jpg");
		}
		
		
		
		u_service.regUser(getModel());
	    this.addActionMessage("注册成功！");
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
