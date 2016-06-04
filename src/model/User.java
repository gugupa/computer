package model;
// default package

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import model.Article;
import model.Comment;


/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="user",catalog="computer")
public class User  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String username;
     private String password;
     private String email;
     private String laber;
     private String img;
     private int integtal;
     private Timestamp rdate;
     private Set<Article> articles = new HashSet<Article>(0);
     private Set<Comment> commentsForSenderId = new HashSet<Comment>(0);
     private Set<Comment> commentsForReceiverId = new HashSet<Comment>(0);


    // Constructors

    /** default constructor */
    public User() {
    }

	/** minimal constructor */
    public User(String username, String password, String email, String laber, int integtal, Timestamp rdate) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.laber = laber;
        this.integtal = integtal;
        this.rdate = rdate;
    }
    
    /** full constructor */
    public User(String username, String password, String email, String laber, String img, int integtal, Timestamp rdate, Set<Article> articles, Set<Comment> commentsForSenderId, Set<Comment> commentsForReceiverId) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.laber = laber;
        this.img = img;
        this.integtal = integtal;
        this.rdate = rdate;
        this.articles = articles;
        this.commentsForSenderId = commentsForSenderId;
        this.commentsForReceiverId = commentsForReceiverId;
    }

   
    // Property accessors
    @Id 
    @GeneratedValue(strategy=IDENTITY)
    @Column(name="id", unique=true, nullable=false)

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    @Column(name="username",nullable=false, length=11)

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    @Column(name="password", nullable=false, length=50)

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    @Column(name="email", nullable=false, length=50)

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    @Column(name="laber",  length=50)

    public String getLaber() {
        return this.laber;
    }
    
    public void setLaber(String laber) {
        this.laber = laber;
    }
    
    @Column(name="img", length=50)

    public String getImg() {
        return this.img;
    }
    
    public void setImg(String img) {
        this.img = img;
    }
    
    @Column(name="integtal", length=50)

    public int getIntegtal() {
        return this.integtal;
    }
    
    public void setIntegtal(int integtal) {
        this.integtal = integtal;
    }
    
    @Column(name="rdate",  length=19)

    public Timestamp getRdate() {
        return this.rdate;
    }
    
    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }
    
    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="user")
    public Set<Article> getArticles() {
        return this.articles;
    }
    
    public void setArticles(Set<Article> articles) {
        this.articles = articles;
    }
    
    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="userBySenderId")
    public Set<Comment> getCommentsForSenderId() {
        return this.commentsForSenderId;
    }
    
    public void setCommentsForSenderId(Set<Comment> commentsForSenderId) {
        this.commentsForSenderId = commentsForSenderId;
    }
    
    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="userByReceiverId")
    public Set<Comment> getCommentsForReceiverId() {
        return this.commentsForReceiverId;
    }
    
    public void setCommentsForReceiverId(Set<Comment> commentsForReceiverId) {
        this.commentsForReceiverId = commentsForReceiverId;
    }
   
}