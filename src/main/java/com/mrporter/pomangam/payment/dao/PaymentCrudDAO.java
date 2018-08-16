package com.mrporter.pomangam.payment.dao;

import java.util.List;
import java.util.Map;

import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.common.util.Date;
import com.mrporter.pomangam.payment.vo.PaymentBean;

/**
 * PaymentCrudDAO
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
public class PaymentCrudDAO extends Crud<PaymentBean> {
	private static final String TABLENAME = "payment"; 
	
	/**
	 * @param tableName
	 */
	public PaymentCrudDAO() {
		super(TABLENAME);
	}
	
	public int getTodayOrder() throws Exception {
		List<Map<String, Object>> lom 
		= sqlQuery("SELECT count(*) FROM payment "
				+ "WHERE timestamp > '" + Date.getCurDay() + " 00:00' "
				+ "AND timestamp < '" + Date.getCurDay() + " 24:00';");
		if(lom==null||lom.isEmpty()) 
			return 0;
		else
			return Integer.parseInt(lom.get(0).get("count(*)")+"");
	}
}
