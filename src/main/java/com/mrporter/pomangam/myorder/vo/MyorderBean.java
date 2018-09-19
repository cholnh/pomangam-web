package com.mrporter.pomangam.myorder.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * MyorderBean
 * 
 * @version 1.0 [2018. 9. 10.]
 * @author Choi
 */
@Data @AllArgsConstructor @NoArgsConstructor
public class MyorderBean {
	Integer idx_box;
	String receive_date, receive_time;
	Integer status;
	String guestname;
	Integer totalprice;
}
