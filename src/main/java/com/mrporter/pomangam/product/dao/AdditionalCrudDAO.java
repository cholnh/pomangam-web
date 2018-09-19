package com.mrporter.pomangam.product.dao;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.product.vo.AdditionalBean;

/**
 * AdditionalCrudDAO
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
public class AdditionalCrudDAO extends Crud<AdditionalBean> {
	private static final String TABLENAME = "product_additional"; 
	
	/**
	 * @param tableName
	 */
	public AdditionalCrudDAO() {
		super(TABLENAME);
	}
	
	public List<AdditionalBean> getListByIdxProduct(Integer idx_product) throws Exception {
		List<Map<String, Object>> lom;
		lom = sqlQuery("SELECT * FROM product_additional WHERE idx_product = ?;", idx_product);
		Gson gson = new Gson();
		return gson.fromJson(gson.toJson(lom), new TypeToken<List<AdditionalBean>>() {}.getType());
	}
}