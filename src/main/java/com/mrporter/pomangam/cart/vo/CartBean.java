package com.mrporter.pomangam.cart.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * CartBean
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
@Data @AllArgsConstructor @NoArgsConstructor
public class CartBean {
	Integer idx, idx_target, idx_restaurant, idx_product, amount;
	String additional, requirement;  // additional:  {idx_product_additional - amount} ex) 1-23 
}
