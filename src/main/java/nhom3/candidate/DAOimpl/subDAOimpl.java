package nhom3.candidate.DAOimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom3.candidate.DAO.subtypeDAO;
import nhom3.candidate.model.Sub_subject_type;

@Repository
@Transactional
public class subDAOimpl implements subtypeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Sub_subject_type> getListSub() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		List<Sub_subject_type> listsub=session.createQuery("from Sub_subject_type").list();
		return listsub;
	}
	
	
	
}
