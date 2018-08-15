package com.mrporter.pomangam.restaurant.dao;

import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.restaurant.vo.RestaurantBean;

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
}
