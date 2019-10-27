package nhom3.candidate.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import nhom3.candidate.DAO.candidateDAO;
import nhom3.candidate.DAO.eventDAO;
import nhom3.candidate.DAO.universityDAO;
import nhom3.candidate.model.ChartData;
import nhom3.candidate.model.ChartLabel;
import nhom3.candidate.model.Datatables;
import nhom3.candidate.model.University;

@Controller
public class ReportController {

    @Autowired
    private eventDAO eventdao;
    @Autowired
    private universityDAO universitydao;
    @Autowired
    private candidateDAO candidatedao;

    @RequestMapping(value = "/getEventFilter/{universityName}/{courseCode}/{planStartDate}/{planEndDate}",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Datatables getEventFilter(@PathVariable String universityName, @PathVariable String courseCode, @PathVariable String planStartDate, @PathVariable String planEndDate){
        //return eventDAO.getEventByUniversityCodeCourseCodePlannedStartDatePlannedEndDate(universityCode,courseCode,planStartDate,planEndDate);
        if(universityName.trim().equals("null"))
        {
            Datatables datatables=new Datatables();
            datatables.setData(eventdao.getEventByAllCourseCodePlannedStartDatePlannedEndDate(courseCode,planStartDate,planEndDate));
            return datatables;
        }
        else {
            Datatables datatables=new Datatables();
            datatables.setData(eventdao.getEventByUniversityCodeCourseCodePlannedStartDatePlannedEndDate(universitydao.getUniversityCode(universityName),courseCode,planStartDate,planEndDate));
            return datatables;
        }
        //return eventDAO.getAllEvent();
    }

    @RequestMapping(value = "/getCandidateFilter/{universityName}",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Datatables getEventFilter(@PathVariable String universityName){
        if(universityName.trim().equals("null"))
        {
            Datatables datatables=new Datatables();
            datatables.setData(candidatedao.getListCandidate());
            return datatables;
        }
        else {
            Datatables datatables=new Datatables();
            datatables.setData(candidatedao.getCandidateByUniversityCode(universitydao.getUniversityCode(universityName)));
            return datatables;
        }
    }

    @RequestMapping(value = "/getAllEventFilter",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Datatables getAllEventFilter(){
        Datatables datatables=new Datatables();
        datatables.setData(eventdao.getListEvent());
        return datatables;
    }

    @RequestMapping(value = "/getAllCandidateFilter",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Datatables getAllUniversityFilter(){
        Datatables datatables=new Datatables();
        datatables.setData(candidatedao.getListCandidate());
        return datatables;
    }

    @RequestMapping(value = "/getChartData",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<ChartData> getChartData(){
        List<University> universities=new ArrayList<University>();
        universities=universitydao.getListUniversity();
        List<ChartData> data=new ArrayList<ChartData>();
        for (University university: universities) {
            ChartData chartData=new ChartData();
            chartData.setData(eventdao.countEventByUniversityCode(university.getUniversity_code()));
            data.add(chartData);
        }
        return data;
    }
    @RequestMapping(value = "/getChartLabel",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<ChartLabel> getChartLabel(){
        List<University> universities=new ArrayList<University>();
        universities=universitydao.getListUniversity();
        List<ChartLabel> label=new ArrayList<ChartLabel>();
        for (University university:universities) {
            ChartLabel chartLabel=new ChartLabel();
            chartLabel.setLabel(university.getUniversity_name());
            label.add(chartLabel);
        }
        return label;
    }

    @RequestMapping(value = "/getChartDataCandidate",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<ChartData> getChartDataCandidate(){
        List<University> universities=new ArrayList<University>();
        universities=universitydao.getListUniversity();
        List<ChartData> data=new ArrayList<ChartData>();
        for (University university: universities) {
            ChartData chartData=new ChartData();
            chartData.setData(eventdao.countEventByUniversityCode(university.getUniversity_code()));
            data.add(chartData);
        }
        return data;
    }
    @RequestMapping(value = "/getChartLabelCandidate",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<ChartLabel> getChartLabelCandidate(){
        List<University> universities=new ArrayList<University>();
        universities=universitydao.getListUniversity();
        List<ChartLabel> label=new ArrayList<ChartLabel>();
        for (University university:universities) {
            ChartLabel chartLabel=new ChartLabel();
            chartLabel.setLabel(university.getUniversity_name());
            label.add(chartLabel);
        }
        return label;
    }
}
