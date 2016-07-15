package action;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import service.ArticleService;
import service.CommentService;
import model.Article;
import model.Comment;
import model.User;

import dao.BaseDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller(value="ArticleAction")  @Scope("prototype")
public class ArticleAction extends ActionSupport implements ModelDriven<Article>{
	
	Article article=new Article();
	List<Article> articles;
	List<Article> authorArticles;
	List<Article> userArticles;
	int userArticleSize;
	int authorArticlesSize;
	int listSize;
	
	private User author;
	
	@Resource(name="ArticleService")
	ArticleService a_service;
	
	@Resource(name="CommentService")
	CommentService c_service;
	
    String keyword="";
    
	public Article getModel() {
		return article;
	}

	//新发布一篇文章(这里强制设置状态为1)
	public String releaseArticle() {
		
		/*设置文章的所有者*/
		User author=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
		 getModel().setUser(author);
			
		
		/*更改文章状态,1表示已发布*/
		getModel().setState(1);
		
		/*新文章的默认积分为0*/
		getModel().setCredit(0);
		
		/*设置文章的发布时间*/
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		getModel().setUptime(d);
		
		System.out.println(getModel().getTitle()+getModel().getAcontent());
		
		if(a_service.newArticle(getModel()))
		{
			this.addActionMessage("发布成功！");	
		}

		return "Person";	
	}
	
	//用于添加文章页面的保存（新文章，但是不发布）
    public String saveArticle() {
		
		/*设置文章的所有者*/
		User author=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
	    getModel().setArticleId(author.getId());
		
		/*更改文章状态,0表示保存状态*/
		getModel().setState(0);
		
		/*新文章的默认积分为0*/
		getModel().setCredit(0);
		
		/*设置文章的最后编辑时间*/
		Timestamp d = new Timestamp(System.currentTimeMillis()); 
		getModel().setUptime(d);
		
		System.out.println(getModel().getTitle()+getModel().getAcontent());
		
		if(a_service.newArticle(getModel()))
		{
			this.addActionMessage("保存成功！");	
		}

		return "Person";	
	}
	
	
    //按页加载验证过的文章:希望这里是一个总的翻页方法
	public String browseArticlesByPage(){
		int page=Integer.valueOf(ServletActionContext.getRequest().getParameter("page"));
		//默认每页显示10条文章
		int pagesize=10;
		System.out.println(page+" "+pagesize);
		articles=a_service.listValidArticlesByPage(page, pagesize);
		listSize=a_service.querySize("from Article as a where a.state='1'");
		ServletActionContext.getRequest().getSession().setAttribute("articles",articles);
		ServletActionContext.getRequest().getSession().setAttribute("listSize",listSize);
		return "resultList";
	}
	
	//查询文章
	public String searchArticles() throws UnsupportedEncodingException {
	    String keyword=new String((this.getKeyword()).getBytes( "ISO8859-1"), "UTF-8");
		String hql="from Article as a where (a.title like '%"+keyword+"%'  or a.acontent like '%"+keyword+"%' ) and a.state=1";
		try{	
			articles=a_service.searchArticleByKeyword(keyword);
			listSize=a_service.querySize(hql);
			ServletActionContext.getRequest().getSession().setAttribute("articles",articles);
			ServletActionContext.getRequest().getSession().setAttribute("listSize",listSize);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "resultList";	
	}
	
	//根据id查询文章
	public String loadArticle() {
		
		int id=Integer.valueOf(ServletActionContext.getRequest().getParameter("id"));
		Article tempArticle=a_service.loadArticle(id);
		ServletActionContext.getRequest().getSession().setAttribute("tempArticle",tempArticle);
		
		//根据id加载这篇文章的评论
		List<Comment> comments=c_service.listAllValidComments(tempArticle.getArticleId());
		//将结果comments存入session
		ServletActionContext.getRequest().getSession().setAttribute("comments", comments);
		
		//根据作者id查询作者信息
		int authorArticleAmount=a_service.querySize("from Article as a where a.user.id="+tempArticle.getUser().getId()+"");
		ServletActionContext.getRequest().getSession().setAttribute("authorArticleAmount", authorArticleAmount);
		
		//根据作者id查询作者文章
		List<Article> authorArticles=a_service.listArticleByAuthor(tempArticle.getUser().getId());
		ServletActionContext.getRequest().getSession().setAttribute("authorArticles", authorArticles);
		
		return "result";	
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public List<Article> getAuthorArticles() {
		return authorArticles;
	}

	public void setAuthorArticles(List<Article> authorArticles) {
		this.authorArticles = authorArticles;
	}

	public int getAuthorArticlesSize() {
		return authorArticlesSize;
	}

	public void setAuthorArticlesSize(int authorArticlesSize) {
		this.authorArticlesSize = authorArticlesSize;
	}

	public User getAuthor() {
		return author;
	}
	
	public ArticleService getA_service() {
		return a_service;
	}

	public void setA_service(ArticleService aService) {
		a_service = aService;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
