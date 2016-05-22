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
	private Article articleId;
	private Integer receiverId;
	private Integer senderId;
	private String commentContent;
	private Timestamp commentTime;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** full constructor */
	public Comment(Article article, Integer receiverId, Integer senderId,
			String commentContent, Timestamp commentTime) {
		this.articleId = article;
		this.receiverId = receiverId;
		this.senderId = senderId;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "article_id")
	public Article getArticleId() {
		return this.articleId;
	}

	public void setArticleId(Article articleId) {
		this.articleId = articleId;
	}

	@Column(name = "receiver_id")
	public Integer getReceiverId() {
		return this.receiverId;
	}

	public void setReceiverId(Integer receiverId) {
		this.receiverId = receiverId;
	}

	@Column(name = "sender_id")
	public Integer getSenderId() {
		return this.senderId;
	}

	public void setSenderId(Integer senderId) {
		this.senderId = senderId;
	}

	@Column(name = "comment_content", length = 50)
	public String getCommentContent() {
		return this.commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	@Column(name = "comment_time", length = 19)
	public Timestamp getCommentTime() {
		return this.commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

}