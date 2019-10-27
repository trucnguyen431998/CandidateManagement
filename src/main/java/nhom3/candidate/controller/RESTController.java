package nhom3.candidate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import nhom3.candidate.DAO.candidateDAO;
import nhom3.candidate.DAO.eventDAO;
import nhom3.candidate.model.Candidate;
import nhom3.candidate.model.Event;

@RestController
public class RESTController {


    @Autowired
    private eventDAO eventdao;
    @Autowired
    private candidateDAO candidatedao;


    @RequestMapping(value = "/getEventByCourseName/{courseName}", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
    @ResponseBody
    public Event getEmployee(@PathVariable("courseName") String courseName) {
        return eventdao.getOneEventById(courseName);
    }

    @RequestMapping(value = "/getCandidateByCandidateCode/{CandidateCode}", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
    @ResponseBody
    public Candidate getCandidateByCandidateCode(@PathVariable("CandidateCode") String CandidateCode) {
        return candidatedao.getCandidateEvent(Integer.valueOf(CandidateCode));
    }


}
