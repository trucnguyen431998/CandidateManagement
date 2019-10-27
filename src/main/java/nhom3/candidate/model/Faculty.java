package nhom3.candidate.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "faculty")
public class Faculty {
	
	
	@Id
	@Column(name="faculty_code")
	@Basic(optional = false)
	private String faculty_code;
	
	@Column(name="faculty_name")
	private String faculty_name;
	
	
	
	public Faculty(String faculty_code, String faculty_name) {
		super();
		this.faculty_code = faculty_code;
		this.faculty_name = faculty_name;
		
	}
	public String getFaculty_code() {
		return faculty_code;
	}
	public void setFaculty_code(String faculty_code) {
		this.faculty_code = faculty_code;
	}
	public String getFaculty_name() {
		return faculty_name;
	}
	public void setFaculty_name(String faculty_name) {
		this.faculty_name = faculty_name;
	}
	public Faculty() {
		super();
	}
	
	
	

}
