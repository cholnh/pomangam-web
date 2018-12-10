package com.mrporter.pomangam.payment.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * PaymentBean
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
@Data @AllArgsConstructor @NoArgsConstructor
public class PaymentBean {
	Integer idx;
	String type;
	Integer idx_target, idx_restaurant, idx_product;
	Integer amount;
	String additional, requirement;
	Integer idx_payment_index, status;
}
