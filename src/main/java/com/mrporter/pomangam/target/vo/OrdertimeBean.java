package com.mrporter.pomangam.target.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * OrdertimeBean
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
@Data @AllArgsConstructor @NoArgsConstructor
public class OrdertimeBean {
	Integer idx, idx_target, type;
	String start, end;
	Integer status;
}
