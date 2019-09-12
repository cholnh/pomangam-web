package com.mrporter.pomangam.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mrporter.pomangam.payment.dao.CouponCrudDAO;
import com.mrporter.pomangam.payment.vo.CouponBean;

/**
 * CouponController
 * 
 * @version 1.0 [2019. 3. 27.]
 * @author Choi
 */

@Controller
public class CouponController {
	
	@RequestMapping(value = "/coupon/findbycpno.do", 
			produces = "application/json; charset=utf-8")
	public @ResponseBody String findByCpno(
			@RequestParam(value = "cpno", required = false) String cpno) throws Exception {
		CouponBean bean = new CouponCrudDAO().findByCpno(cpno);
		return bean==null?null:new Gson().toJson(bean);
	}
}
