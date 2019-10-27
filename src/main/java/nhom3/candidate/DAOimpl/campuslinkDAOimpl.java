package nhom3.candidate.DAOimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom3.candidate.DAO.campuslinkDAO;
import nhom3.candidate.model.Campuslink;
import nhom3.candidate.model.University;

@Repository
@Transactional
public class campuslinkDAOimpl implements campuslinkDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Campuslink> getListCampuslink() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		List<Campuslink> listCampuslink=session.createQuery("from Campuslink").list();
		return listCampuslink;
	}

}
