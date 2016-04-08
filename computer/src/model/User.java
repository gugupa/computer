package model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "computer")
public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String email;
	private String laber;
	private String img;
	private String integtal;
	private Timestamp rdate;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String username, String password, String email, String laber,
			String img, String integtal, Timestamp rdate) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.laber = laber;
		this.img = img;
		this.integtal = integtal;
		this.rdate = rdate;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "username", length = 11)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "laber", length = 50)
	public String getLaber() {
		return this.laber;
	}

	public void setLaber(String laber) {
		this.laber = laber;
	}

	@Column(name = "img", length = 50)
	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Column(name = "integtal", length = 50)
	public String getIntegtal() {
		return this.integtal;
	}

	public void setIntegtal(String integtal) {
		this.integtal = integtal;
	}

	@Column(name = "rdate", length = 19)
	public Timestamp getRdate() {
		return this.rdate;
	}

	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}

}