package nhom3.candidate.DAOimpl;

import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import nhom3.candidate.DAO.chartDAO;
import nhom3.candidate.model.CanvasjsChartData;

@Repository
@Transactional
public class chartDAOimpl implements chartDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		// TODO Auto-generated method stub
		return CanvasjsChartData.getCanvasjsDataList();
	}
	
	

}
