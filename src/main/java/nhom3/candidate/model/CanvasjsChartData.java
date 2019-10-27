package nhom3.candidate.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import nhom3.candidate.DAO.universityDAO;
import nhom3.candidate.DAOimpl.universityDAOimpl;


public class CanvasjsChartData {
	
	static Map<Object,Object> map = null;
	static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
	static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
	
	static {
		map = new HashMap<Object,Object>(); map.put("x", 10); map.put("y", 69);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 20); map.put("y", 48);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 30); map.put("y", 26);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 40); map.put("y", 50);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 50); map.put("y", 67);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 60); map.put("y", 38);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 70L); map.put("y", 100);dataPoints1.add(map);
		map = new HashMap<Object,Object>(); map.put("x", 80); map.put("y", 63);dataPoints1.add(map);
		/*
		 * map = new HashMap<Object,Object>(); map.put("x", 90); map.put("y",
		 * 57);dataPoints1.add(map); map = new HashMap<Object,Object>(); map.put("x",
		 * 100); map.put("y", 60);dataPoints1.add(map); map = new
		 * HashMap<Object,Object>(); map.put("x", 110); map.put("y",
		 * 38);dataPoints1.add(map); map = new HashMap<Object,Object>(); map.put("x",
		 * 120); map.put("y", 49);dataPoints1.add(map); map = new
		 * HashMap<Object,Object>(); map.put("x", 130); map.put("y",
		 * 37);dataPoints1.add(map);
		 */
		
		list.add(dataPoints1);
	}
 
	public static List<List<Map<Object, Object>>> getCanvasjsDataList() {
		return list;
	}


}
