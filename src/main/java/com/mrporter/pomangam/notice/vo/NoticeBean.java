package com.mrporter.pomangam.notice.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * NoticeBean
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
@Data @AllArgsConstructor @NoArgsConstructor
public class NoticeBean {
	Integer idx;
	String title, contents, imgpath;
}
