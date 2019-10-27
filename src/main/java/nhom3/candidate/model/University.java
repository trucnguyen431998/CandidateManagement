package nhom3.candidate.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "university")
public class University {
	
	
	@Id
	@Column(name = "university_code")
	@Basic(optional = false)
	private String university_code;
	
	@Column(name = "university_name")
	private String university_name;
	
	
	@Column(name = "level_university")
	private int level_university;
	
	
	public String getUniversity_code() {
		return university_code;
	}
	public void setUniversity_code(String university_code) {
		this.university_code = university_code;
	}
	public String getUniversity_name() {
		return university_name;
	}
	public void setUniversity_name(String university_name) {
		this.university_name = university_name;
	}
	
	public int getLevel_university() {
		return level_university;
	}
	public void setLevel_university(int level_university) {
		this.level_university = level_university;
	}
	
	public University(String university_code, String university_name, int level_university) {
		super();
		this.university_code = university_code;
		this.university_name = university_name;
		
		this.level_university = level_university;
	}
	public University() {
		super();
	}
	
	

}
