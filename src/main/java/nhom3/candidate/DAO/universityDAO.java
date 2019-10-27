package nhom3.candidate.DAO;

import java.util.List;

import nhom3.candidate.model.University;

public interface universityDAO {
	public List<University> getListUniversity();
	 public String getUniversityCode(String universityName);

}
