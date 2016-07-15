package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.validator.annotations.Validation;
import com.opensymphony.xwork2.validator.annotations.Validations;

import service.ArticleService;
import service.UserService;
import util.MD5;

import model.User;

@Controller(value="UserAction")  @Scope("prototype") 
public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	User user=new User();
	
	private File image;
	private String imageContentType;
	private String imageFileName;
	
	//邮箱或昵称
	private String email_username;
	
	private Map<String,Object> session;
	
	@Resource(name="UserService")
	UserService u_service;

	@Resource(name="ArticleService")
	ArticleService a_service;
	
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
		
		/*查询注册email是否已经存在*/
		String  email=this.getModel().getEmail();
		
		/*查询username是否已经存在*/
		String  username=this.getModel().getUsername();
		
		/*以上两项数据库中没有重复值    可以注册*/
		if (u_service.checkEmail(email)==null&&u_service.checkUsername(username)==null) {
			
			/*注册时间只在第一次注册时赋予初值*/
			Timestamp d = new Timestamp(System.currentTimeMillis()); 
			getModel().setRdate(d);
			
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
		    
		    //用户注册成功后即为登录状态
			ServletActionContext.getRequest().getSession().setAttribute("user",getModel());
			session.put("user", getModel());
			
		}else{
			//弹出消息框的部分有问题 数据库的操作是正确的
			if (u_service.checkEmail(email)!=null) {
				this.addActionMessage("该邮箱"+email+"已注册过！");
			} else {
				this.addActionMessage("昵称重复请修改！");
			}
		}
		
		
		
	    return "index";		
	}
	
	//修改用户资料：允许修改： 邮箱 用户名 头像
	public String editUser() throws Exception{

		User current=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
		
		/*如果用户修改了email    查询改email是否已被其他用户使用*/
		boolean isEmail=false;
		String  email=this.getModel().getEmail();
		if (email.equals(current.getEmail())) {
			isEmail=true;
		}else {
			isEmail=u_service.checkEmail(email)==null?true:false;
		}
		
		/*如果用户修改了username    查询改username是否已被其他用户使用*/
		boolean isUsername=false;
		String  username=this.getModel().getUsername();
		if (username.equals(current.getUsername())) {
			isUsername=true;
		}else {
			isUsername=u_service.checkUsername(username)==null?true:false;
		}
		
		/*以上两项数据库中没有重复值    可以修改资料*/
		if (isEmail&&isUsername) {
			
			current.setEmail(email);
			current.setUsername(username);
			
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
				current.setImg("upload/"+imageFileName);
			} else {
				current.setImg("upload/NoImage.jpg");
			}
			
			u_service.editUser(current);
		    //这一部分弹出框有问题
	       this.addActionMessage("修改资料成功！");
	    			
		}else{
			//弹出消息框的部分有问题 数据库的操作是正确的
			if (u_service.checkEmail(email)!=null) {
				this.addActionMessage("该邮箱"+email+"已注册过！");
			} else {
				this.addActionMessage("昵称重复请修改！");
			}
		}
		
		return "Person";		
	}

	//登录(邮箱和昵称都可以登陆)
	public String login(){
		//MD5加密
		getModel().setPassword(MD5.calcMD5(getModel().getPassword()));

		User tempUser=u_service.login(email_username,getModel());
		
		if (tempUser!=null) {
			ServletActionContext.getRequest().getSession().setAttribute("user",tempUser);
			viewMyArticles(tempUser.getId());
			return "index";
		} else {
			addActionMessage("用户名或密码错误!");
		}
		return "input";
	}

	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public ArticleService getA_service() {
		return a_service;
	}


	public void setA_service(ArticleService aService) {
		a_service = aService;
	}


	//注销
	public String quit(){
		ServletActionContext.getRequest().getSession().removeAttribute("user");
		return "Person";
	}
	
	
	public  void viewMyArticles(int id){
		a_service.listArticleByAuthor(id);
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


	public void setEmail_username(String email_username) {
		this.email_username = email_username;
	}


	public String getEmail_username() {
		return email_username;
	}


	public void setSession(Map<String,Object> session) {
		this.session = session;
	}


	public Map<String,Object> getSession() {
		return session;
	}





}
