package nhom3.candidate.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "campuslink")
public class Campuslink {
	
	@Id
	@Column(name = "campuslink_code")
	private String campuslink_code;
	
	@Column(name = "campuslink_name")
	private String campuslink_name;
	
	@Column(name = "time")
	private int time;
	
	@Column(name = "description")
	private String description;

	public String getCampuslink_code() {
		return campuslink_code;
	}

	public void setCampuslink_code(String campuslink_code) {
		this.campuslink_code = campuslink_code;
	}

	public String getCampuslink_name() {
		return campuslink_name;
	}

	public void setCampuslink_name(String campuslink_name) {
		this.campuslink_name = campuslink_name;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Campuslink(String campuslink_code, String campuslink_name, int time, String description) {
		super();
		this.campuslink_code = campuslink_code;
		this.campuslink_name = campuslink_name;
		this.time = time;
		this.description = description;
	}

	public Campuslink() {
		super();
	}
	
	

}
