package nhom3.candidate.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "candidate")
public class Candidate {
	
	@Id
	@Column(name = "candidate_code")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	private int candidate_code;
	
	@Column(name = "national_id")
	private int national_id;
	
	@Column(name = "account")
	private String account;
	
	@Column(name = "name")
	private String name;
	
	
	
	@JoinColumn(name = "university_code", referencedColumnName = "university_code")
	@ManyToOne(targetEntity = University.class,fetch = FetchType.EAGER)
	@Basic(optional = false)
	private University  university_code;
	
	
	
	@JoinColumn(name = "faculty_code", referencedColumnName = "faculty_code")
	@ManyToOne(targetEntity = Faculty.class)
	@Basic(optional = false)
	private Faculty faculty_code;
	
	@Column(name = "dob")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	private Date dob;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "e_mail")
	private String e_mail;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "facebook")
	private String facebook;
	
	@Column(name = "university_graduation_date")
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Temporal(TemporalType.DATE)
	private Date university_graduation_date;
	
	@Column(name = "full_time_working")
	private String full_time_working;
	
	@Column(name = "status")
	private String status;
	
	@Column(name = "final_grade")
	private String final_grade;
	
	@Column(name = "completion_level")
	private String completion_level;
	
	
	@Column(name = "certificate_id")
	private String certificate_id;
	
	@JoinColumn(name = "campuslink_code", referencedColumnName = "campuslink_code")
	@ManyToOne(targetEntity = Campuslink.class)
	@Basic(optional = false)
	private Campuslink campuslink_code;
	
	@JoinColumn(name = "sub_subject_type_code", referencedColumnName = "sub_subject_type_code")
	@ManyToOne(targetEntity = Sub_subject_type.class)
	@Basic(optional = false)
	private Sub_subject_type sub_subject_type_code;
	
	@Column(name = "gpa")
	private String gpa;
	
	
	@JoinColumn(name = "iu_code", referencedColumnName = "iu_code")
	@ManyToOne(targetEntity = Information_update.class)
	@Basic(optional = false)
	private Information_update iu_code;
	
	
	
	//@ManyToMany(cascade = { CascadeType.ALL })
    //@JoinTable(
        //name = "event_candidate", 
        //joinColumns = { @JoinColumn(name = "candidate_code") }, 
        //inverseJoinColumns = { @JoinColumn(name = "event_code") }
    //)
    //Set<Event> events = new HashSet<>();
	
	

	//public Set<Event> getEvents() {
		//return events;
	//}

	//public void setEvents(Set<Event> events) {
		//this.events = events;
	//}

	public int getCandidate_code() {
		return candidate_code;
	}

	public void setCandidate_code(int candidate_code) {
		this.candidate_code = candidate_code;
	}

	public int getNational_id() {
		return national_id;
	}

	public void setNational_id(int national_id) {
		this.national_id = national_id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public University getUniversity_code() {
		return university_code;
	}

	public void setUniversity_code(University university_code) {
		this.university_code = university_code;
	}

	public Faculty getFaculty_code() {
		return faculty_code;
	}

	public void setFaculty_code(Faculty faculty_code) {
		this.faculty_code = faculty_code;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public Date getUniversity_graduation_date() {
		return university_graduation_date;
	}

	public void setUniversity_graduation_date(Date university_graduation_date) {
		this.university_graduation_date = university_graduation_date;
	}

	public String getFull_time_working() {
		return full_time_working;
	}

	public void setFull_time_working(String full_time_working) {
		this.full_time_working = full_time_working;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFinal_grade() {
		return final_grade;
	}

	public void setFinal_grade(String final_grade) {
		this.final_grade = final_grade;
	}

	public String getCompletion_level() {
		return completion_level;
	}

	public void setCompletion_level(String completion_level) {
		this.completion_level = completion_level;
	}

	public String getCertificate_id() {
		return certificate_id;
	}

	public void setCertificate_id(String certificate_id) {
		this.certificate_id = certificate_id;
	}

	public Campuslink getCampuslink_code() {
		return campuslink_code;
	}

	public void setCampuslink_code(Campuslink campuslink_code) {
		this.campuslink_code = campuslink_code;
	}

	public Sub_subject_type getSub_subject_type_code() {
		return sub_subject_type_code;
	}

	public void setSub_subject_type_code(Sub_subject_type sub_subject_type_code) {
		this.sub_subject_type_code = sub_subject_type_code;
	}

	public String getGpa() {
		return gpa;
	}

	public void setGpa(String gpa) {
		this.gpa = gpa;
	}


	public Candidate(int candidate_code, int national_id, String account, String name, University university_code,
			Faculty faculty_code, Date dob, String gender, String e_mail, String phone, String facebook,
			Date university_graduation_date, String full_time_working, String status, String final_grade,
			String completion_level, String certificate_id, Campuslink campuslink_code,
			Sub_subject_type sub_subject_type_code, String gpa, Information_update iu_code, Set<Event> events) {
		super();
		this.candidate_code = candidate_code;
		this.national_id = national_id;
		this.account = account;
		this.name = name;
		this.university_code = university_code;
		this.faculty_code = faculty_code;
		this.dob = dob;
		this.gender = gender;
		this.e_mail = e_mail;
		this.phone = phone;
		this.facebook = facebook;
		this.university_graduation_date = university_graduation_date;
		this.full_time_working = full_time_working;
		this.status = status;
		this.final_grade = final_grade;
		this.completion_level = completion_level;
		this.certificate_id = certificate_id;
		this.campuslink_code = campuslink_code;
		this.sub_subject_type_code = sub_subject_type_code;
		this.gpa = gpa;
		this.iu_code = iu_code;
		//this.events = events;
	}

	public Information_update getIu_code() {
		return iu_code;
	}

	public void setIu_code(Information_update iu_code) {
		this.iu_code = iu_code;
	}

	public Candidate() {
		super();
	}
	
	
	
	

}
