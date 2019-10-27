package nhom3.candidate.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role {
	
	@Id
	@Column(name="role_code")
	private int role_code;
	
	@Column(name="role_name")
	private String role_name;

	public Role(int role_code, String role_name) {
		super();
		this.role_code = role_code;
		this.role_name = role_name;
	}

	public int getRole_code() {
		return role_code;
	}

	public void setRole_code(int role_code) {
		this.role_code = role_code;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public Role() {
		super();
	}
	
	

}
