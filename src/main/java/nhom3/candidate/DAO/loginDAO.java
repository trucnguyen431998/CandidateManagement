package nhom3.candidate.DAO;

import nhom3.candidate.model.Admin;

public interface loginDAO {
	
	public boolean getAdmin(String email, String password);
	public Admin getId(String email);

}
