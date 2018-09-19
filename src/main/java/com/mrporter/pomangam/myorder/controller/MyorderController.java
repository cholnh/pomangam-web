package com.mrporter.pomangam.myorder.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.map.dao.MapCrudDAO;
import com.mrporter.pomangam.common.pattern.vo.Status;
import com.mrporter.pomangam.common.security.model.domain.User;
import com.mrporter.pomangam.payment.dao.PaymentIndexCrudDAO;
import com.mrporter.pomangam.payment.vo.PaymentIndexBean;

@Controller
public class MyorderController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyorderController.class);
	private static final String MAPPINGNAME = "myorder";
	
	@RequestMapping(value = "/"+MAPPINGNAME+".do")
	public ModelAndView openIndexPage(
			@RequestParam(value = "guestname", required = false) String guestname,
			@RequestParam(value = "phonenumber", required = false) String phonenumber,
			@RequestParam(value = "password", required = false) String password,
			HttpSession session,
			HttpServletResponse response) throws Exception {

		ModelAndView model = new ModelAndView();
		model.setViewName("contents/" + MAPPINGNAME);
		
		PaymentIndexCrudDAO indexDAO = new PaymentIndexCrudDAO();
		String userjson = (String) session.getAttribute("user");
		User user = new Gson().fromJson(userjson, new TypeToken<User>() {}.getType());
			
		List<PaymentIndexBean> orderList = new ArrayList<>();
		List<Integer> payNumberList = null;
		if(user==null) {
			if(guestname==null||phonenumber==null||password==null) {
				response.sendRedirect("./");
				return null;
			}
			payNumberList = indexDAO.getPayNumberByGuestname(guestname, phonenumber, password);
			if(payNumberList!=null&&!payNumberList.isEmpty()) {
				for(Integer paynumber : payNumberList) {
					PaymentIndexBean bean =	indexDAO.getBeanByIdx(paynumber);
					orderList.add(bean);
				}
			} else {
				response.sendRedirect("./guestcheck.do?error=true");
				return null;
			}
		} else {
			payNumberList = indexDAO.getPayNumberByUsername(user.getUsername());
			if(payNumberList!=null&&!payNumberList.isEmpty()) {
				for(Integer paynumber : payNumberList) {
					PaymentIndexBean bean =	indexDAO.getBeanByIdx(paynumber);
					orderList.add(bean);
				}
			} 
		} 
		
		
		MapCrudDAO map = new MapCrudDAO();
		model.addObject("bank_name", map.getValue("bank_name"));
		model.addObject("bank_account", map.getValue("bank_account"));
		model.addObject("bank_username", map.getValue("bank_username"));
		model.addObject("orderList", orderList);
		return model;
	}
	
	@RequestMapping(value = "/guestcheck.do")
	public ModelAndView guestCheck() throws Exception {

		ModelAndView model = new ModelAndView();
		model.setViewName("contents/guestcheck");
		
		return model;
	}
	
	@ExceptionHandler
	public @ResponseBody Status handle(Exception e, HttpServletResponse response) {
		if(e.getClass().getSimpleName().equals("AccessDeniedException")) {
			try {
				response.sendRedirect("./denied"); 
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		if(e.getClass().getSimpleName().equals("MethodArgumentTypeMismatchException")) {
			try {
				response.sendRedirect("./");
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		logger.info("Exception Handler - " + e.getMessage());
		return new Status(400, "Exception handled!");
	}
	
}
