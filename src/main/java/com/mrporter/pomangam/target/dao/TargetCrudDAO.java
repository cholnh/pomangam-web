package com.mrporter.pomangam.target.dao;

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
}
