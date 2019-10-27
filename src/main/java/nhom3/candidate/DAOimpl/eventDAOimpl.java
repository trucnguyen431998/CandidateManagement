package nhom3.candidate.DAOimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom3.candidate.DAO.eventDAO;
import nhom3.candidate.model.Event;

@Repository
@Transactional
public class eventDAOimpl implements eventDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Event> getListEvent() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		List<Event> listEvent=session.createQuery("from Event").list();
		return listEvent;
	}
	
	
	@Override
	public Event getEvent(int idEvent) {
		// TODO Auto-generated method stub
		
		return (Event)sessionFactory.getCurrentSession().get(Event.class, idEvent);
	}

	@Override
	public void addEvent(Event ev) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		session.save(ev);
		
	}

	@Override
	public void updateEvent(Event ev) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		
		Event event=new Event();
		Query query= session.createQuery("from Event e where e.event_code = :id "); 
		query.setParameter("id", ev.getEvent_code());
		event = (Event)query.list().get(0);
		
		event.setSite(ev.getSite());
		event.setUniversity_code(ev.getUniversity_code());
		event.setCourse_name(ev.getCourse_name());
		event.setSub_subject_type_code(ev.getSub_subject_type_code());
		event.setCourse_code(ev.getCourse_code());
		event.setCourse_status(ev.getCourse_status());
		event.setPlanned_start_date(ev.getPlanned_start_date());
		event.setPlanned_end_date(ev.getPlanned_end_date());
		event.setActual_start_date(ev.getActual_start_date());
		event.setActual_end_date(ev.getActual_end_date());
		event.setActual_learning_time(ev.getActual_learning_time());
		event.setActual_expense(ev.getActual_expense());
		event.setTraining_feedback(ev.getTraining_feedback());
		event.setTraining_feedback_content(ev.getTraining_feedback_content());
		event.setTraining_feedback_teacher(ev.getTraining_feedback_teacher());
		event.setTraining_feedback_organization(ev.getTraining_feedback_organization());

		session.update(event);
		
	}

	@Override
	public void deleteEvent(int event_code) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		Event ev=(Event)sessionFactory.getCurrentSession().load(Event.class, event_code);
		session.delete(ev);
		
	}

	@Override
	public Event getEventString(String code) {
		// TODO Auto-generated method stubO
		return (Event)sessionFactory.getCurrentSession().get(Event.class, code);
	}

	@Override
	public int countEventByUniversityCode(String universityCode) {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Event E WHERE E.university_code.university_code = :university_code");
        query.setParameter("university_code",universityCode);
        List<Event> eventList=query.list();
        return eventList.size();
	}

	@Override
	public List<Event> getEventByUniversityCodeCourseCodePlannedStartDatePlannedEndDate(String universityCode,
			String courseCode, String planStartDate, String planEndDate) {
		// TODO Auto-generated method stub
		 Session session = this.sessionFactory.getCurrentSession();
	        Query query = session.createQuery("FROM Event E WHERE E.planned_start_date >= :planned_start_date AND E.planned_end_date <= :planned_end_date AND E.university_code = :university_code AND E.course_code = :course_code");
	        query.setParameter("planned_start_date",planStartDate);
	        query.setParameter("university_code",universityCode);
	        query.setParameter("planned_end_date",planEndDate);
	        query.setParameter("course_code",courseCode);
	        List<Event> eventList=query.list();
	        return eventList;
	}

	@Override
	public Event getOneEventById(String courseName) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Event E WHERE E.course_name= :course_name");
        query.setParameter("course_name", courseName);
        List<Event> eventList=query.list();
        if(eventList.size()>0){
            Event event=eventList.get(eventList.size()-1);
            return event;
        }
        return null;
	}
	
	@Override
	public List<Event> getAllEventByCourseName(String courseName) {
		// TODO Auto-generated method stub
		 Session session = this.sessionFactory.getCurrentSession();
	        Query query = session.createQuery("FROM Event E WHERE E.course_name= :course_name");
	        query.setParameter("course_name",courseName);
	        List<Event> eventList=query.list();
	        return eventList;
	}

	@Override
	public boolean isEventExist(Event event) {
		// TODO Auto-generated method stub
		return getAllEventByCourseName(event.getCourse_name().toString())!=null;
	}

	@Override
	public boolean checkCourseCodeExist(String email) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Event where course_code = :course_code");
        query.setParameter("course_code",email);
        List<Event> listExistCourseCode=query.list();
        if(listExistCourseCode.size()>0){
            return true;
        }
        else return false;
		
		
	}

	@Override
	public List<Event> getEventByAllCourseCodePlannedStartDatePlannedEndDate(String courseCode, String planStartDate,
			String planEndDate) {
		// TODO Auto-generated method stub
		 Session session = this.sessionFactory.getCurrentSession();
	        Query query = session.createQuery("FROM Event E WHERE E.planned_start_date >= :planned_start_date AND E.planned_end_date <= :planned_end_date AND E.course_code = :course_code");
	        query.setParameter("planned_start_date",planStartDate);
	        query.setParameter("planned_end_date",planEndDate);
	        query.setParameter("course_code",courseCode);
	        List<Event> eventList=query.list();
	        return eventList;
	}

	
	


	

}
