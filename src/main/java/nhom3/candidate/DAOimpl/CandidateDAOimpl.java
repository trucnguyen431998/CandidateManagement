package nhom3.candidate.DAOimpl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom3.candidate.DAO.candidateDAO;
import nhom3.candidate.model.Candidate;

@Repository
@Transactional
public class CandidateDAOimpl implements candidateDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public List<Candidate> getListCandidate() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		List<Candidate> listCandidate=session.createQuery("from Candidate").list();
		return listCandidate;
		
	}
	@Override
	public Candidate getCandidateEvent(int idCandidate) {
		// TODO Auto-generated method stub
		return (Candidate)sessionFactory.getCurrentSession().get(Candidate.class, idCandidate);
	}
	@Override
	public void addCandidate(Candidate candidate) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		candidate.setAccount(candidate.getE_mail());
		session.save(candidate);
		
	}
	@Override
	public void updateCandidate(Candidate candidate) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		Candidate can=new Candidate();
		Date date=new Date();
		Query query= session.createQuery("from Candidate a where a.candidate_code = :email ");
		query.setParameter("email", candidate.getCandidate_code()); // set primary
		can = (Candidate)query.list().get(0);
		  can.setName("N'"+candidate.getName()+"'"); 
		  can.setDob(candidate.getDob());
		  can.setE_mail(candidate.getE_mail()); 
		  can.setGender(candidate.getGender());
		  can.setPhone(candidate.getPhone()); 
		  can.setFacebook(candidate.getFacebook());
		  can.setUniversity_code(candidate.getUniversity_code());
		  can.setFaculty_code(candidate.getFaculty_code());
		  can.setUniversity_graduation_date(date);
		  can.setFull_time_working(candidate.getFull_time_working());
		  can.setStatus(candidate.getStatus());
		  can.setFinal_grade(candidate.getFinal_grade());
		  can.setCompletion_level(candidate.getCompletion_level());
		  can.setCertificate_id(candidate.getCertificate_id());
		  can.setGpa(candidate.getGpa());
		  can.setCampuslink_code(candidate.getCampuslink_code());
		  can.setSub_subject_type_code(candidate.getSub_subject_type_code());
		  can.setFaculty_code(candidate.getFaculty_code());
		 
		
		session.update(can);
	}
	@Override
	public void deleteCandidate(int candidate_code) {
		// TODO Auto-generated method stub
		Session session=this.sessionFactory.getCurrentSession();
		Candidate can =(Candidate)sessionFactory.getCurrentSession().load(Candidate.class, candidate_code);
		session.delete(can);
	}
	@Override
	public List<Candidate> searchCandidate(String s) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery(" FROM Candidate c where c.e_mail like :s");
		query.setParameter("s","%"+s+"%");
		//query.setParameter("s","%g%");
		List<Candidate> candidateList=query.list();
		return candidateList;
	}
	@Override
	public List<Candidate> getListCanlendar() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		List<Candidate> listCalendar=session.createQuery("from Candidate").list();
		return listCalendar;
		
	}
	@Override
	public List<Candidate> getCandidateByUniversityCode(String universityCode) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Candidate E WHERE E.university_code.university_code = :university_code");
		query.setParameter("university_code",universityCode);
		List<Candidate> candidateList=query.list();
		return candidateList;
	}

	

}
