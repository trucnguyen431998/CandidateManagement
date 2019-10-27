package nhom3.candidate.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sub_subject_type")
public class Sub_subject_type {
	
	
	@Id
	@Column(name="sub_subject_type_code")
	@Basic(optional = false)
	private String sub_subject_code;
	
	@Column(name="sub_subject_type_name")
	private String sub_subject_type_name;
	
	@Column(name="description")
	private String description;
	
	public String getSub_subject_code() {
		return sub_subject_code;
	}
	public void setSub_subject_code(String sub_subject_code) {
		this.sub_subject_code = sub_subject_code;
	}
	public String getSub_subject_type_name() {
		return sub_subject_type_name;
	}
	public void setSub_subject_type_name(String sub_subject_type_name) {
		this.sub_subject_type_name = sub_subject_type_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Sub_subject_type(String sub_subject_code, String sub_subject_type_name, String description) {
		super();
		this.sub_subject_code = sub_subject_code;
		this.sub_subject_type_name = sub_subject_type_name;
		this.description = description;
	}
	public Sub_subject_type() {
		super();
	}
	
	

}
