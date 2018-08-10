package com.mrporter.pomangam.common.login.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * AdminBean
 * 
 * @version 1.0 [2018. 3. 29.]
 * @author Choi
 */
@Data @AllArgsConstructor @NoArgsConstructor
public class UserBean {
	Integer idx;
	String username, password, name, nickname;
	Integer targetidx, subscribeidx;
	String regdate, moddate;
}
