package nhom3.candidate.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "event")
public class Event {
	
	@Id
	@Column(name="event_code")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private int event_code;
	
	
    @Column(name="site")
    private String site;
   
    @Column(name="course_code")
    private String course_code;
    
    
    @JoinColumn(name = "course_name", referencedColumnName = "campuslink_code")
   	@ManyToOne(targetEntity = Campuslink.class)
   	@Basic(optional = false)
    private Campuslink course_name;
    
    
    @Column(name="subject_type")
    private String subject_type;
    
    
    @JoinColumn(name = "sub_subject_type_code", referencedColumnName = "sub_subject_type_code")
   	@ManyToOne(targetEntity = Sub_subject_type.class)
   	@Basic(optional = false)
    private Sub_subject_type sub_subject_type_code;
    
    
    @Column(name="format_type")
    private String format_type;
    
    
    @JoinColumn(name = "university_code", referencedColumnName = "university_code")
	@ManyToOne(targetEntity = University.class,fetch = FetchType.EAGER)
	@Basic(optional = false)
    private University university_code;
    
    @Column(name="planned_start_date")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Temporal(TemporalType.DATE)
    private Date planned_start_date;
    
    @Column(name="planned_end_date")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Temporal(TemporalType.DATE)
    private Date planned_end_date;
    
    
    @Column(name="planned_expense")
    private String planned_expense;
    
    
    @Column(name="budget_code")
    private String budget_code;
    
    
    @Column(name="actual_start_date")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Temporal(TemporalType.DATE)
    private Date actual_start_date;
    
    
    @Column(name="actual_end_date")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Temporal(TemporalType.DATE)
    private Date actual_end_date;
    
    
    @Column(name="actual_learning_time")
    private int actual_learning_time;
    
    
    @Column(name="actual_expense")
    private String actual_expense;
    
    
    @Column(name="training_feedback")
    private String training_feedback;
    
    
    @Column(name="training_feedback_content")
    private String training_feedback_content;
    
    
    @Column(name="training_feedback_teacher")
    private String training_feedback_teacher;
    
    
    @Column(name="training_feedback_organization")
    private String training_feedback_organization;
    
    
    @Column(name="note")
    private String note;
    
    
    @Column(name="course_status")
    private String course_status;
    
    
    @JoinColumn(name = "iu_code", referencedColumnName = "iu_code")
	@ManyToOne(targetEntity = Information_update.class)
	@Basic(optional = false)
    private Information_update iu_code;
    
    
    
	/*
	 * @ManyToMany(mappedBy = "events") private Set<Candidate> candidates = new
	 * HashSet<>();
	 * 
	 * 
	 * public Set<Candidate> getCandidates() { return candidates; }
	 * 
	 * public void setCandidates(Set<Candidate> candidates) { this.candidates =
	 * candidates; }
	 */


	public int getEvent_code() {
		return event_code;
	}


	public void setEvent_code(int event_code) {
		this.event_code = event_code;
	}


	public String getSite() {
		return site;
	}


	public void setSite(String site) {
		this.site = site;
	}


	public String getCourse_code() {
		return course_code;
	}


	public void setCourse_code(String course_code) {
		this.course_code = course_code;
	}




	public String getSubject_type() {
		return subject_type;
	}


	public void setSubject_type(String subject_type) {
		this.subject_type = subject_type;
	}



	public String getFormat_type() {
		return format_type;
	}


	public void setFormat_type(String format_type) {
		this.format_type = format_type;
	}





	public Date getPlanned_start_date() {
		return planned_start_date;
	}


	public void setPlanned_start_date(Date planned_start_date) {
		this.planned_start_date = planned_start_date;
	}


	public Date getPlanned_end_date() {
		return planned_end_date;
	}


	public void setPlanned_end_date(Date planned_end_date) {
		this.planned_end_date = planned_end_date;
	}


	public String getPlanned_expense() {
		return planned_expense;
	}


	public void setPlanned_expense(String planned_expense) {
		this.planned_expense = planned_expense;
	}


	public String getBudget_code() {
		return budget_code;
	}


	public void setBudget_code(String budget_code) {
		this.budget_code = budget_code;
	}


	public Date getActual_start_date() {
		return actual_start_date;
	}


	public void setActual_start_date(Date actual_start_date) {
		this.actual_start_date = actual_start_date;
	}


	public Date getActual_end_date() {
		return actual_end_date;
	}


	public void setActual_end_date(Date actual_end_date) {
		this.actual_end_date = actual_end_date;
	}


	public int getActual_learning_time() {
		return actual_learning_time;
	}


	public void setActual_learning_time(int actual_learning_time) {
		this.actual_learning_time = actual_learning_time;
	}


	public String getActual_expense() {
		return actual_expense;
	}


	public void setActual_expense(String actual_expense) {
		this.actual_expense = actual_expense;
	}


	public String getTraining_feedback() {
		return training_feedback;
	}


	public void setTraining_feedback(String training_feedback) {
		this.training_feedback = training_feedback;
	}


	public String getTraining_feedback_content() {
		return training_feedback_content;
	}


	public void setTraining_feedback_content(String training_feedback_content) {
		this.training_feedback_content = training_feedback_content;
	}


	public String getTraining_feedback_teacher() {
		return training_feedback_teacher;
	}


	public void setTraining_feedback_teacher(String training_feedback_teacher) {
		this.training_feedback_teacher = training_feedback_teacher;
	}


	public String getTraining_feedback_organization() {
		return training_feedback_organization;
	}


	public void setTraining_feedback_organization(String training_feedback_organization) {
		this.training_feedback_organization = training_feedback_organization;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public String getCourse_status() {
		return course_status;
	}


	public void setCourse_status(String course_status) {
		this.course_status = course_status;
	}


	public Information_update getIu_code() {
		return iu_code;
	}


	public void setIu_code(Information_update iu_code) {
		this.iu_code = iu_code;
	}


	public Event() {
		super();
	}


	public Campuslink getCourse_name() {
		return course_name;
	}


	public void setCourse_name(Campuslink course_name) {
		this.course_name = course_name;
	}


	public Sub_subject_type getSub_subject_type_code() {
		return sub_subject_type_code;
	}


	public void setSub_subject_type_code(Sub_subject_type sub_subject_type_code) {
		this.sub_subject_type_code = sub_subject_type_code;
	}


	public University getUniversity_code() {
		return university_code;
	}


	public void setUniversity_code(University university_code) {
		this.university_code = university_code;
	}


	public Event(int event_code, String site, String course_code, Campuslink course_name, String subject_type,
			Sub_subject_type sub_subject_type_code, String format_type, University university_code,
			Date planned_start_date, Date planned_end_date, String planned_expense, String budget_code,
			Date actual_start_date, Date actual_end_date, int actual_learning_time, String actual_expense,
			String training_feedback, String training_feedback_content, String training_feedback_teacher,
			String training_feedback_organization, String note, String course_status, Information_update iu_code,
			Set<Candidate> candidates) {
		super();
		this.event_code = event_code;
		this.site = site;
		this.course_code = course_code;
		this.course_name = course_name;
		this.subject_type = subject_type;
		this.sub_subject_type_code = sub_subject_type_code;
		this.format_type = format_type;
		this.university_code = university_code;
		this.planned_start_date = planned_start_date;
		this.planned_end_date = planned_end_date;
		this.planned_expense = planned_expense;
		this.budget_code = budget_code;
		this.actual_start_date = actual_start_date;
		this.actual_end_date = actual_end_date;
		this.actual_learning_time = actual_learning_time;
		this.actual_expense = actual_expense;
		this.training_feedback = training_feedback;
		this.training_feedback_content = training_feedback_content;
		this.training_feedback_teacher = training_feedback_teacher;
		this.training_feedback_organization = training_feedback_organization;
		this.note = note;
		this.course_status = course_status;
		this.iu_code = iu_code;
		//this.candidates = candidates;
	}



	
    
    

    
}
