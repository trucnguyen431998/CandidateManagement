package nhom3.candidate.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import nhom3.candidate.DAO.campuslinkDAO;
import nhom3.candidate.DAO.candidateDAO;
import nhom3.candidate.DAO.eventDAO;
import nhom3.candidate.DAO.facultyDAO;
import nhom3.candidate.DAO.loginDAO;
import nhom3.candidate.DAO.subtypeDAO;
import nhom3.candidate.DAO.universityDAO;
import nhom3.candidate.model.Admin;
import nhom3.candidate.model.Candidate;
import nhom3.candidate.model.CanvasjsChartData;
import nhom3.candidate.model.Event;
import nhom3.candidate.model.University;

@Controller
public class HomeController {
	
	
	@Autowired
	private loginDAO logindao;
	
	@Autowired
	private universityDAO universitydao;
	
	
	@Autowired
	private candidateDAO candidatedao;
	private String m;
	
	@Autowired
	private eventDAO eventdao;
	
	@Autowired
	private facultyDAO facultydao;
	
	@Autowired
	private campuslinkDAO campuslinkdao;
	
	@Autowired
	private subtypeDAO subdao;
	
	int demcandidate=0;
	int demEvent=0;
	int demuni=0;

	//xử lý trang home
	@RequestMapping(value = {"/","/Login"})
	public String showHome(Model model)
	{
		model.addAttribute("logindata", new Admin());
		return "Login";
	}
	
	
	@RequestMapping(value = "/Dashboard")
	public String login(Model model,ModelMap modelMap,HttpSession sessioncan)
	{
		if(m!=null)
		{
			List<List<Map<Object, Object>>> canvasjsDataList = CanvasjsChartData.getCanvasjsDataList();
			
			modelMap.addAttribute("dataPointsList", canvasjsDataList);
			
			
			List<Candidate> listCandidate=candidatedao.getListCandidate();
			demcandidate=listCandidate.size();
			
			
			List<Event> listEvent=eventdao.getListEvent();
			demEvent=listEvent.size();
			
			
			List<University> listuni =universitydao.getListUniversity();
			demuni=listuni.size();
			
			sessioncan.setAttribute("soCandidate", demcandidate);
			sessioncan.setAttribute("soEvent", demEvent);
			sessioncan.setAttribute("soUni", demuni);
			sessioncan.setAttribute("sott", demEvent+1);
			
			
			return "Dashboard";
		}
		else
		{
			return"redirect:error";
		}
		
	}
	
	@RequestMapping(value= "/logout")
	public String Logout(Model model,HttpSession session)
	{
		model.addAttribute("logout",true);
		m=null;
		session.removeAttribute("soCandidate");
		session.removeAttribute("soEvent");
		session.removeAttribute("soUni");
		return "redirect:Login";
	}
	@RequestMapping(value = "/passLogin",method = RequestMethod.POST)
	public String passLogin(Model model,@ModelAttribute("logindata") Admin admin,HttpSession session)
	{
		
		
		boolean check=logindao.getAdmin(admin.getUsername(), admin.getPassword());
		
		if(check)
		{
			model.addAttribute("logindata", admin);
			session.setAttribute("username", logindao.getId(admin.getUsername()).getUsername() );
			m=logindao.getId(admin.getUsername()).getUsername();
			
			return "redirect:Dashboard";
		}
		else
		{
			model.addAttribute("error", true);
			return "redirect:Login";
		}
	}
	
	
	@RequestMapping(value = "/candidate")
	public String showCandidate1(Model model)
	{
		
		if(m !=null)
		{
			
			List<Candidate> listCandidate=candidatedao.getListCandidate();
			for(Candidate candidate : listCandidate)
			{
				System.out.println("emp No"+candidate.getCandidate_code());
				
			}
			
			model.addAttribute("candidate", listCandidate);
			model.addAttribute("filter", new Candidate());
			model.addAttribute("universitydata", universitydao.getListUniversity());
			model.addAttribute("subdata", subdao.getListSub());
			model.addAttribute("campuslinkdata", campuslinkdao.getListCampuslink());
			
			return "candidate";
		}
		else
		{
			return "redirect:error";
		}
		
	}
	
	@RequestMapping(value = "/addCandidate")
	public String addCandidate(Model model)
	{
		if(m!=null)
		{
			model.addAttribute("candidatedata", new Candidate());
			model.addAttribute("universitydata", universitydao.getListUniversity());
			model.addAttribute("facultydata", facultydao.getListFaculty());
			model.addAttribute("campuslinkdata", campuslinkdao.getListCampuslink());
			model.addAttribute("subdata", subdao.getListSub());
			model.addAttribute("eventdata", eventdao.getListEvent());
			return "addCandidate";
		}
		else
		{
			return "redirect:error";
		}
	}
	@RequestMapping(value = "/passAdd",method = RequestMethod.POST)
	public String passCandidate(Model model,@ModelAttribute("candidatedata") Candidate ev)
	{
		System.out.println(ev.getCandidate_code());
		candidatedao.addCandidate(ev);
		return "redirect:candidate";
		
	}

	
	@RequestMapping(value = "/viewCandidate")
	private String viewCandidate(Model model,HttpServletRequest request)
	{
		//int id=Integer.parseInt(request.getParameter("id"));
		
		if(m!=null)
		{
			int id=Integer.valueOf(request.getParameter("id").toString());
			
			Candidate candidate=candidatedao.getCandidateEvent(id);
			model.addAttribute("candidatedata", candidate);
			return "viewCandidate";
		}
		else
		{
			return "redirect:error";
		}
	}
	
	@RequestMapping(value = "/EditCandidate",method = RequestMethod.GET)
	private String updateCandidate(Model model,HttpServletRequest request)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		
		Candidate can=candidatedao.getCandidateEvent(id);
		model.addAttribute("universitydata", universitydao.getListUniversity());
		model.addAttribute("facultydata", facultydao.getListFaculty());
		model.addAttribute("campuslinkdata", campuslinkdao.getListCampuslink());
		model.addAttribute("subdata", subdao.getListSub());
		model.addAttribute("updatedata", can);
		
		return "EditCandidate";
	}
	@RequestMapping(value = "/passUpdateCandidate",method = RequestMethod.POST)
	public String passUpdateCadidate(@ModelAttribute("updatedata") Candidate candidate)
	{
		System.out.println(candidate.getAccount());
		candidatedao.updateCandidate(candidate);
		return "redirect:/candidate";
	}
	
	@RequestMapping(value = "/Delete")
	public String deleteCandidate(HttpServletRequest request)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		candidatedao.deleteCandidate(id);
		return "redirect:/candidate";
	}
	
	
	@RequestMapping(value = "/Event")
	public String showEvent(Model model)
	{
		if(m!=null)
		{
			List<Event> listEvent=eventdao.getListEvent();
			for(Event ev : listEvent)
			{
				System.out.println("emp No"+ev.getEvent_code());
			}
			model.addAttribute("listEvent", listEvent);
			model.addAttribute("filterEvent", new Event());
			model.addAttribute("universitydata", universitydao.getListUniversity());
			model.addAttribute("subdata", subdao.getListSub());
			model.addAttribute("campuslinkdata", campuslinkdao.getListCampuslink());
			return "Event";
		}
		else
		{
			return "redirect:error";
		}
		
	}
	@RequestMapping(value = "/deleteEvent")
	public String deleteEvent(HttpServletRequest request)
	{
		int id=Integer.parseInt(request.getParameter("id"));
		eventdao.deleteEvent(id);
		return "redirect:/Event";
	}
	
	@RequestMapping(value = "/AddEvent")
	public String addEvent(Model model)
	{
		if(m!=null)
		{
			model.addAttribute("eventData", new Event());
			model.addAttribute("universitydata", universitydao.getListUniversity());
			model.addAttribute("facultydata", facultydao.getListFaculty());
			model.addAttribute("campuslinkdata", campuslinkdao.getListCampuslink());
			model.addAttribute("subdata", subdao.getListSub());
			return "AddEvent";
		}
		else
		{
			return "redirect:error";
		}
	}
	
	@RequestMapping(value = "/passAddEvent",method = RequestMethod.POST)
	public String passAddEvent(Model model,@ModelAttribute("eventData")Event event, BindingResult result)
	{
		System.out.println(event.getUniversity_code());
		eventdao.addEvent(event);
		return "redirect:Event";
		
	}
	@RequestMapping(value = "/ViewEvent")
	public String viewEvent(Model model,HttpServletRequest request)
	{
		if(m!=null)
		{
			int id=Integer.valueOf(request.getParameter("id").toString());
			
			Event event=eventdao.getEvent(id);
			model.addAttribute("viewEvent", event);
		
			return "viewEvent";
		}
		else
		{
			return "redirect:error";
		}
	}
	
	@RequestMapping(value = "/EditEvent")
	public String updateEvent(Model model,HttpServletRequest request)
	{
		int eventId=Integer.parseInt(request.getParameter("id"));
		
		Event event=eventdao.getEvent(eventId);
		
		model.addAttribute("universitydata", universitydao.getListUniversity());
		
		model.addAttribute("campuslinkdata", campuslinkdao.getListCampuslink());
		model.addAttribute("subdata", subdao.getListSub());
		model.addAttribute("EditEventData", event);
		return "editEvent";
	}
	@RequestMapping(value = "/passUpdateEvent",method = RequestMethod.POST)
	public String passUpdateEvent(@ModelAttribute("EditEventData")Event event,BindingResult result)
	{
		System.out.println(event.getCourse_code());
		eventdao.updateEvent(event);
		return "redirect:/Event";
	}
	
	
	
	
	
	@RequestMapping(value = "/searchCandidate/{s}",method = RequestMethod.GET)
	@ResponseBody
	public String searchContent(@PathVariable String s){
		List<Candidate> list = candidatedao.searchCandidate(s);
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}
	
	
	@RequestMapping(value = "/loadCandidate")
	@ResponseBody
	public String loadCandidate(){

		List<Candidate> list = candidatedao.getListCandidate();
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}
	
	
	@RequestMapping(value = "/error")
	public String error(Model model)
	{
		return "error";
	}
	
	@RequestMapping(value = "/Statistic")
	public String showStatistic(Model model)
	{
		
		return "Statistic";
	}
	
	@RequestMapping(value = "/checkCourseCode",method = RequestMethod.GET)
	@ResponseBody
	public String checkEmail(@RequestParam String email){
		List<String> list=new ArrayList<String>();
		if(eventdao.checkCourseCodeExist(email))
			list.add("success:true");
		else
			list.add("success:false");
		ObjectMapper mapper = new ObjectMapper();
		String ajaxResponse = "";
		try {
			ajaxResponse = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return ajaxResponse;
	}
	

}
