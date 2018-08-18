package com.mrporter.pomangam.product.dao;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.product.vo.ProductBean;

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
	
	public List<ProductBean> getBeanList(Integer idx) throws Exception {
		List<ProductBean> result = null;
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT * FROM " + TABLENAME + " WHERE idx_restaurant=?", idx);
		if(!lom.isEmpty()) {
			Gson gson = new Gson();
			result = new Gson().fromJson(gson.toJson(lom), 
					new TypeToken<List<ProductBean>>() {}.getType());
		}
		return result;
	}
	
	public List<ProductBean> getRecommend(Integer idx) throws Exception {
		List<ProductBean> result = null;
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT p.idx, p.imgpath, p.name, p.price, p.cnt_limit " +
				"FROM product p, product_recommend r " +
				"WHERE r.idx_product = ? AND p.idx = r.idx_product_recommend;", idx);
		if(!lom.isEmpty()) {
			Gson gson = new Gson();
			result = new Gson().fromJson(gson.toJson(lom), 
					new TypeToken<List<ProductBean>>() {}.getType());
		}
		return result;
	}
}
