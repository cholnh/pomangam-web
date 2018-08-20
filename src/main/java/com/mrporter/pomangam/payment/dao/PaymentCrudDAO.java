package com.mrporter.pomangam.payment.dao;

import com.mrporter.pomangam.common.pattern.dao.Crud;
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
}
