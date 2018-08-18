package com.mrporter.pomangam.product.dao;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.product.vo.ProductBean;
import com.mrporter.pomangam.restaurant.vo.RestaurantBean;

/**
 * ProductCrudDAO
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
public class ProductCrudDAO extends Crud<ProductBean> {
	private static final String TABLENAME = "product"; 
	
	/**
	 * @param tableName
	 */
	public ProductCrudDAO() {
		super(TABLENAME);
	}
	
	public List<ProductBean> getBeanList() throws Exception {
		List<ProductBean> result = null;
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT * FROM " + TABLENAME);
		if(!lom.isEmpty()) {
			Gson gson = new Gson();
			result = new Gson().fromJson(gson.toJson(lom), 
					new TypeToken<List<ProductBean>>() {}.getType());
		}
		return result;
	}
}
