package com.mrporter.pomangam.product.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AdditionalBean
 * 
 * @version 1.0 [2018. 9. 7.]
 * @author Choi
 */
@Data @AllArgsConstructor @NoArgsConstructor
public class AdditionalBean {
	Integer idx, idx_product;
	String name;
	Integer price;
}
