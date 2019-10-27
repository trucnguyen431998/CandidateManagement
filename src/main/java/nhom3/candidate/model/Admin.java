package nhom3.candidate.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
public class Admin {
	@Id
	@Column(name="user_name")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@JoinColumn(name = "role_code", referencedColumnName = "role_code")
	@ManyToOne(targetEntity = Role.class)
	@Basic(optional = false)
	private Role role_code;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole_code() {
		return role_code;
	}

	public void setRole_code(Role role_code) {
		this.role_code = role_code;
	}

	public Admin(String username, String password, Role role_code) {
		super();
		this.username = username;
		this.password = password;
		this.role_code = role_code;
	}

	public Admin() {
		super();
	}
	
	
	

}
