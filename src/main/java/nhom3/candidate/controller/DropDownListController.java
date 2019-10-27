package nhom3.candidate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import nhom3.candidate.DAO.campuslinkDAO;
import nhom3.candidate.DAO.candidateDAO;
import nhom3.candidate.DAO.eventDAO;
import nhom3.candidate.DAO.subtypeDAO;
import nhom3.candidate.DAO.universityDAO;
import nhom3.candidate.model.Campuslink;
import nhom3.candidate.model.Candidate;
import nhom3.candidate.model.Event;
import nhom3.candidate.model.Sub_subject_type;
import nhom3.candidate.model.University;

@RestController
public class DropDownListController {

    @Autowired
    private universityDAO universitydao;
    @Autowired
    private subtypeDAO subSubjectTypedao;
    @Autowired
    private campuslinkDAO campusLinkdao;
    @Autowired
    private eventDAO eventdao;
    @Autowired
    private candidateDAO candidatedao;


    @RequestMapping(value = "/getAllSubjectType",method = RequestMethod.GET, produces="application/json")
    @ResponseBody
    public List<Sub_subject_type> getSub_subject_types() {
        return subSubjectTypedao.getListSub();
    }
    @RequestMapping(value = "/getAllCampusLink",method = RequestMethod.GET, produces="application/json")
    @ResponseBody
    public List<Campuslink> getAllCampusLink() {
        return campusLinkdao.getListCampuslink();
    }
    @RequestMapping(value = "/getAllEvent",method = RequestMethod.GET, produces="application/json")
    @ResponseBody
    public List<Event> getAllEvent() {
        return eventdao.getListEvent();
    }

    @RequestMapping(value = "/getAllSchool",method = RequestMethod.GET, produces="application/json")
    @ResponseBody
    public List<University> getEmployee() {
        return universitydao.getListUniversity();
    }

    @RequestMapping(value = "/getAllCandidate",method = RequestMethod.GET, produces="application/json")
    @ResponseBody
    public List<Candidate> getCandidate() {
        return candidatedao.getListCandidate();
    }



}
