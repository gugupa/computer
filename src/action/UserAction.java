package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

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
	
	private File image;
	private String imageContentType;
	private String imageFileName;
	

	@Resource(name="UserService")
	UserService u_service;

	public User getModel(){
		if(user==null){
			return new User();
		}
		return user;
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
		
		image=getImage();
		System.out.println("uu"+getModel().getImg());
		System.out.println("vv"+image);
		
		if (image!=null) {
			try {
				InputStream is =new FileInputStream(image);
				String fileContentType=this.getImageContentType();
				//判断指定文件的扩展名，生成相应的随机码
				if (fileContentType.equals("image/jpeg")||fileContentType.equals("image/pjpeg")) {
					//生成随机码
					imageFileName=UUID.randomUUID().toString()+".jpg";
				} else if(fileContentType.equals("image/gif")){
					imageFileName=UUID.randomUUID().toString()+".gif";
				}else if (fileContentType.equals("image/png")) {
					imageFileName=UUID.randomUUID().toString()+".png";
				}
				File file=new File(path,imageFileName);
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
		if (image!=null) {
			getModel().setImg("upload/"+imageFileName);
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

	
	public UserService getU_service() {
		return u_service;
	}
	
	public void setU_service(UserService uService) {
		u_service = uService;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}





}
