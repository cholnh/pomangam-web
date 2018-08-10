package com.mrporter.pomangam.common.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Date
 * 
 * @version 1.0 [2018. 4. 19.]
 * @author Choi
 */
public class Date {
	public static String getCurDate() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}
	
	public static String getCurTime() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss SSS");
		LocalDateTime now = LocalDateTime.now();
		return dtf.format(now);
	}
}
