package nhom3.candidate.DAO;

import java.util.List;

import nhom3.candidate.model.Event;

public interface eventDAO {
	
public List<Event> getListEvent();
    
    public Event getEvent(int idEvent);
	
	public void addEvent(Event ev);

	public void updateEvent(Event ev);
	
	public void deleteEvent(int event_code);
	
	public Event getEventString(String code);
	public int countEventByUniversityCode(String universityCode);
	public List<Event> getEventByUniversityCodeCourseCodePlannedStartDatePlannedEndDate(String universityCode, String courseCode,String planStartDate, String planEndDate);
	
	public Event getOneEventById(String courseName);
	public boolean isEventExist(Event event);
	 public List<Event> getAllEventByCourseName(String courseName);
	 public boolean checkCourseCodeExist(String email);
	 public List<Event> getEventByAllCourseCodePlannedStartDatePlannedEndDate(String courseCode,String planStartDate, String planEndDate);
}
