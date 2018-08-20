package com.mrporter.pomangam.payment.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * PaymentIndexBean
 * 
 * @version 1.0 [2018. 8. 19.]
 * @author Choi
 */
@Data @AllArgsConstructor @NoArgsConstructor
public class PaymentIndexBean {
	Integer idx;
	String idxes_payment, password, timestamp;
	Integer idx_box;
}
