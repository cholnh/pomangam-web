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
		lom = sqlQuery("SELECT additional FROM product WHERE idx = ?;", idx_product);
		
		if(lom.isEmpty()) return null;
		 
		String[] additional = (lom.get(0).get("additional")+"").split(",");
		String idxes = "";
		for(int i=0; i<additional.length; i++) {
			String idx = additional[i];
			idxes += idx;
			if(i!=additional.length-1) {
				idxes += ",";
			}
		}
		//System.out.println(idxes);
		if(additional.length>0) {
			lom = sqlQuery("SELECT * FROM product_additional WHERE idx in ("+idxes+")");
		}
		//System.out.println(lom.size());
		Gson gson = new Gson();
		return gson.fromJson(gson.toJson(lom), new TypeToken<List<AdditionalBean>>() {}.getType());
	}
	
	public static void main(String...args) {
		try {
			System.out.println(new AdditionalCrudDAO().getListByIdxProduct(28));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}