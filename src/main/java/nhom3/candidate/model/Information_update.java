package nhom3.candidate.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "information_update")
public class Information_update {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="iu_code")
	private int iu_code;
	
	@Column(name="user_name")
	private String user_name;
	
	@Column(name="update_date")
	private Date update_date;
	
	@Column(name="description")
	private String description;

	public Information_update(int iu_code, String user_name, Date update_date, String description) {
		super();
		this.iu_code = iu_code;
		this.user_name = user_name;
		this.update_date = update_date;
		this.description = description;
	}

	public int getIu_code() {
		return iu_code;
	}

	public void setIu_code(int iu_code) {
		this.iu_code = iu_code;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Information_update() {
		super();
	}
	
	

}
