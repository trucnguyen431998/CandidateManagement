package nhom3.candidate.DAOimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom3.candidate.DAO.facultyDAO;
import nhom3.candidate.model.Faculty;
import nhom3.candidate.model.University;

@Repository
@Transactional
public class facultyDAOimpl implements facultyDAO  {
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Faculty> getListFaculty() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		List<Faculty> listFaculty=session.createQuery("from Faculty").list();
		return listFaculty;
	}

}
