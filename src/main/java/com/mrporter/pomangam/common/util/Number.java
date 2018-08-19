package com.mrporter.pomangam.common.util;

import java.text.DecimalFormat;

/**
 * Number
 * 
 * @version 1.0 [2018. 8. 19.]
 * @author Choi
 */
public class Number {
	public static String numberWithCommas(int num) {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(num);
	}
}
