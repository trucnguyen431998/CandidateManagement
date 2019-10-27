package nhom3.candidate.DAOimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nhom3.candidate.DAO.loginDAO;
import nhom3.candidate.model.Admin;

@Repository
@Transactional
public class loginDAOimpl implements loginDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		
	}
	

	public boolean getAdmin(String email, String password) {
		// TODO Auto-generated method stub
		Admin admin=new Admin();
		Session session = this.sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Admin a where a.username=:user_name and a.password=:password");
		query.setParameter("user_name", email);
		query.setParameter("password", password);
		List<Admin> adminList=query.list();
		
		if(adminList !=null && adminList.size()>0)
		{
			return true;
		}
		return false;
		
	}

	public Admin getId(String email) {
		// TODO Auto-generated method stub
		Admin admin=new Admin();
		Session session = this.sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Admin a where a.username=:user_name");
		 query.setParameter("user_name",email);
		 List<Admin> listAdmin=query.list();
		 if ((listAdmin != null) && (listAdmin.size() > 0)) {
	            return (Admin) listAdmin.get(listAdmin.size()-1);
	            
	        }
	        return null;
	}
	

}
