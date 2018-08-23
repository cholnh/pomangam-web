package com.mrporter.pomangam.target.dao;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.target.vo.DestinationBean;

/**
 * DestinationCrudDAO
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
public class DestinationCrudDAO extends Crud<DestinationBean> {
	private static final String TABLENAME = "target_destination"; 
	
	/**
	 * @param tableName
	 */
	public DestinationCrudDAO() {
		super(TABLENAME);
	}
	
	public List<DestinationBean> getListByIdx(Integer idx) throws Exception {
		List<Map<String, Object>> listOfMaps;
		listOfMaps = sqlQuery("SELECT * FROM " + TABLENAME + " WHERE idx_target=?", idx); 
		Gson gson = new Gson();
		return gson.fromJson(gson.toJson(listOfMaps), 
				new TypeToken<List<DestinationBean>>() {}.getType());
	}
	
	public List<DestinationBean> getListGroupByIdx(Integer idx) throws Exception {
		List<Map<String, Object>> listOfMaps;
		listOfMaps = sqlQuery("SELECT * FROM " + TABLENAME + " WHERE idx_target=? GROUP BY destination", idx); 
		Gson gson = new Gson();
		return gson.fromJson(gson.toJson(listOfMaps), 
				new TypeToken<List<DestinationBean>>() {}.getType());
	}
	
}
