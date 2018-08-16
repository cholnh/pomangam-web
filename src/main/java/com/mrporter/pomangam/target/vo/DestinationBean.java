package com.mrporter.pomangam.target.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DestinationBean
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
@Data @AllArgsConstructor @NoArgsConstructor
public class DestinationBean {
	Integer idx, idx_target, type;
	String destination, arrival;
}
