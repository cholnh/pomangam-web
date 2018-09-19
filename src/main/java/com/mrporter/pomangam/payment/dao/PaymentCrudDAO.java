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
	
	public void setPaymentIndex(Integer idx_payment, Integer idx_payment_index) throws Exception {
		sqlUpdate("UPDATE payment SET idx_payment_index = ? WHERE idx = ?", 
				idx_payment_index, idx_payment);
	}
}
