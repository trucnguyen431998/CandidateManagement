package nhom3.candidate.DAOimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom3.candidate.DAO.universityDAO;
import nhom3.candidate.model.University;

@Repository
@Transactional
public class universityDAOimpl implements universityDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<University> getListUniversity() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		List<University> listUniversity=session.createQuery("from University").list();
		for(University university:listUniversity) {
			String s=university.getUniversity_name();
			s = s.replaceAll("\\n", "");
			s = s.replaceAll("\\r", "");
			university.setUniversity_name(s);
		}
		return listUniversity;
	}

	@Override
	public String getUniversityCode(String universityName) {
		// TODO Auto-generated method stub
		 Session session = this.sessionFactory.getCurrentSession();
	        Query query = session.createQuery("FROM University e WHERE e.university_name = :university_name");
	        query.setParameter("university_name",universityName);
	        List<University> universityList=query.list();
	        if(universityList.size()>0)
	            return universityList.get(universityList.size()-1).getUniversity_code();
	        else
	            return "";
	}
	
	
	
	

}
