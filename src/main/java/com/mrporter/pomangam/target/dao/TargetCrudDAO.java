package com.mrporter.pomangam.target.dao;

import java.util.List;
import java.util.Map;

import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.target.vo.TargetBean;

/**
 * LiveCrudDAO
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
public class TargetCrudDAO extends Crud<TargetBean> {
	private static final String TABLENAME = "target"; 
	
	/**
	 * @param tableName
	 */
	public TargetCrudDAO() {
		super(TABLENAME);
	}
	
	public int getSumOrder() throws Exception {
		List<Map<String, Object>> lom = sqlQuery("SELECT sum(cnt_order) FROM target;");
		if(lom==null||lom.isEmpty()) 
			return 0;
		else
			return Integer.parseInt(lom.get(0).get("sum(cnt_order)")+"");
	}
}
