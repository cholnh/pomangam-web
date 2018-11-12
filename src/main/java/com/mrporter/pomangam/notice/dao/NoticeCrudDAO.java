package com.mrporter.pomangam.notice.dao;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.notice.vo.NoticeBean;

/**
 * NoticeCrudDAO
 * 
 * @version 1.0 [2018. 11. 1.]
 * @author Choi
 */
public class NoticeCrudDAO extends Crud<NoticeBean> {
	private static final String TABLENAME = "notice"; 
	
	/**
	 * @param tableName
	 */
	public NoticeCrudDAO() {
		super(TABLENAME);
	}
	
	public List<NoticeBean> getBeanList() throws Exception {
		List<NoticeBean> result = null;
		
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT * FROM " + TABLENAME);
		if(!lom.isEmpty()) {
			Gson gson = new Gson();
			result = new Gson().fromJson(gson.toJson(lom), 
					new TypeToken<List<NoticeBean>>() {}.getType());
		}
		return result;
	}
}

