package nhom3.candidate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import nhom3.candidate.DAO.eventDAO;
import nhom3.candidate.model.Calendar;
import nhom3.candidate.model.Event;

@Controller
public class CalendarController {
    @Autowired
    private eventDAO eventdao;

    @RequestMapping(value = "/loadCalendarData")
    @ResponseBody
    public String getCalendarData(){
        List<Calendar> calendars=new ArrayList<Calendar>();
        List<Event> events=eventdao.getListEvent();
        for(Event event:events){
            Calendar calendar=new Calendar();
            calendar.setTitle(event.getCourse_name().toString());
            calendar.setStart(event.getPlanned_start_date().toString());
            calendar.setEnd(event.getPlanned_end_date().toString());
            calendars.add(calendar);
        }
        ObjectMapper mapper = new ObjectMapper();
        String ajaxResponse = "";
        try {
            ajaxResponse = mapper.writeValueAsString(calendars);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return ajaxResponse;
    }
}
