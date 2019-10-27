package nhom3.candidate.DAO;

import java.util.List;

import nhom3.candidate.model.Candidate;

public interface candidateDAO {
	
	public List<Candidate> getListCandidate();
    
    public Candidate getCandidateEvent(int idCandidate);
	
	public void addCandidate(Candidate candidate);

	public void updateCandidate(Candidate candidate);
	
	public void deleteCandidate(int candidate_code);
	public List<Candidate> searchCandidate(String s);
	public List<Candidate> getListCanlendar();
	public List<Candidate> getCandidateByUniversityCode(String universityCode);
	

}
