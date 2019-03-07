package com.mrporter.pomangam.restaurant.dao;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.restaurant.vo.RestaurantBean;
import com.mrporter.pomangam.target.vo.TargetAdBean;

/**
 * RestaurantCrudDAO
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
public class RestaurantCrudDAO extends Crud<RestaurantBean> {
	private static final String TABLENAME = "restaurant"; 
	
	/**
	 * @param tableName
	 */
	public RestaurantCrudDAO() {
		super(TABLENAME);
	}
	
	public void closeRestaurant() throws Exception {
		sqlUpdate("UPDATE restaurant SET isPause = 1");
	}
	
	public void closeExceptionalRestaurant() throws Exception {
		sqlUpdate("UPDATE restaurant SET isPause = 1 where idx = ", 7);
	}
	
	public void openRestaurant() throws Exception {
		sqlUpdate("UPDATE restaurant SET isPause = 0");
	}
	
	public List<TargetAdBean> getAdList(Integer idx) throws Exception {
		List<TargetAdBean> result = null;
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT * FROM target_ad WHERE idx_target = ? ORDER BY sequence", idx);
		if(!lom.isEmpty()) {
			Gson gson = new Gson();
			result = new Gson().fromJson(gson.toJson(lom), 
					new TypeToken<List<TargetAdBean>>() {}.getType());
		}
		return result;
	}
	
	public String getStartTime(Integer idx) throws Exception {
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT " +
					"start " +
				"FROM " + 
					"restaurant " +
				"WHERE " + 
					"idx= ?", idx);
		return lom.get(0).get("start")+"";
	}
	
	public String getEndTime(Integer idx) throws Exception {
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT " +
					"end " +
				"FROM " + 
					"restaurant " +
				"WHERE " + 
					"idx = ?", idx);
		return lom.get(0).get("end")+"";
	}
	
	public List<RestaurantBean> getBeanWithLimitCount(Integer idx) throws Exception {
		List<RestaurantBean> result = null;
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT " +
					"* " +
				"FROM " + 
					"restaurant " +
				"WHERE " + 
					"idx_target = ? ORDER BY sequence", idx); // ORDER BY RAND()
		/*
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT " +
					"r.idx, r.idx_target, r.name, r.location, r.tel, r.description, r.imgpath, r.cnt_star, r.cnt_comment, sum(p.cnt_limit) as sum_limit " +
				"FROM " + 
					"restaurant r, product p " +
				"WHERE " + 
					"r.idx=p.idx_restaurant AND r.idx_target = ? " +
				"GROUP BY " + 
					"r.idx;"
				, idx);
		*/
		if(!lom.isEmpty()) {
			Gson gson = new Gson();
			result = new Gson().fromJson(gson.toJson(lom), 
					new TypeToken<List<RestaurantBean>>() {}.getType());
		}
		return result;
	}
	
}
