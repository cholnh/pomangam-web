package com.mrporter.pomangam.target.dao;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.target.vo.OrdertimeBean;

/**
 * OrdertimeCrudDAO
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
public class OrdertimeCrudDAO extends Crud<OrdertimeBean> {
	private static final String TABLENAME = "target_ordertime"; 
	
	/**
	 * @param tableName
	 */
	public OrdertimeCrudDAO() {
		super(TABLENAME);
	}
	
	public List<OrdertimeBean> getListByIdx(Integer idx) throws Exception {
		List<Map<String, Object>> listOfMaps;
		listOfMaps = sqlQuery("SELECT * FROM " + TABLENAME + " WHERE idx_target=?", idx); 
		Gson gson = new Gson();
		return gson.fromJson(gson.toJson(listOfMaps), 
				new TypeToken<List<OrdertimeBean>>() {}.getType());
	}
}
