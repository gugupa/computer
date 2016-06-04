package model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "comment", catalog = "computer")
public class Comment implements java.io.Serializable {

	// Fields

	private Integer inforId;
	private User userByReceiverId;
	private User userBySenderId;
	private Article article;
	private String commentContent;
	private Timestamp commentTime;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** full constructor */
	public Comment(User userByReceiverId, User userBySenderId, Article article,
			String commentContent, Timestamp commentTime) {
		this.userByReceiverId = userByReceiverId;
		this.userBySenderId = userBySenderId;
		this.article = article;
		this.commentContent = commentContent;
		this.commentTime = commentTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "infor_id", unique = true, nullable = false)
	public Integer getInforId() {
		return this.inforId;
	}

	public void setInforId(Integer inforId) {
		this.inforId = inforId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "receiver_id", nullable = false)
	public User getUserByReceiverId() {
		return this.userByReceiverId;
	}

	public void setUserByReceiverId(User userByReceiverId) {
		this.userByReceiverId = userByReceiverId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sender_id", nullable = false)
	public User getUserBySenderId() {
		return this.userBySenderId;
	}

	public void setUserBySenderId(User userBySenderId) {
		this.userBySenderId = userBySenderId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "article_id", nullable = false)
	public Article getArticle() {
		return this.article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	@Column(name = "comment_content", nullable = false, length = 50)
	public String getCommentContent() {
		return this.commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	@Column(name = "comment_time", nullable = false, length = 19)
	public Timestamp getCommentTime() {
		return this.commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

}