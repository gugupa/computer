package action;

import java.util.List;

import javax.annotation.Resource;

import model.Article;
import model.Comment;
import model.User;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import service.CommentService;

@Controller(value="CommentAction")  @Scope("prototype")
public class CommentAction extends ActionSupport implements ModelDriven<Comment>{
	
	Comment comment=new Comment();
	List<Comment> comments;
	
	@Resource(name="CommentService")
	CommentService c_service;

	public Comment getModel() {	
		return comment;
	}

	public CommentService getC_service() {
		return c_service;
	}

	public void setC_service(CommentService cService) {
		c_service = cService;
	}
	
	//保存一条评论,添加完成以后仍是在当前页面
	public String saveComment(){
		
		//评论人id记录:sender
		User reviewer=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
		getModel().setSenderId(reviewer.getId());
		  
		
		//当前文章的记录:article_id
		Article tempArticle=(Article) ServletActionContext.getRequest().getSession().getAttribute("tempArticle");
		getModel().setArticleId(tempArticle);
		
		System.out.println("User："+reviewer);
		System.out.println("Article："+tempArticle);
		System.out.println("saveComment");
		String CommentContent=getModel().getCommentContent();
		System.out.println("getCommentContent:"+CommentContent);
		c_service.saveComment(getModel());
		
		return INPUT;
	}
//	
//	//显示某篇文章下的评论
//	public String listAllValidComments(){
//		//获取文章id
//		Article tempArticle=(Article) ServletActionContext.getRequest().getSession().getAttribute("tempArticle");
//		List<Comment> comments=c_service.listAllValidComments(tempArticle.getArticleId());
//		//将结果comments存入session
//		ServletActionContext.getRequest().getSession().setAttribute("comments", comments);
//		return INPUT;
//	}
//	
	public String loadComment(){
		int id=Integer.valueOf(ServletActionContext.getRequest().getParameter("id"));
		Comment comment=c_service.loadComment(id);
		ServletActionContext.getRequest().getSession().setAttribute("comment",comment);
		return "result";
	}
}