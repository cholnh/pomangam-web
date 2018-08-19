package com.mrporter.pomangam.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
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

import com.mrporter.pomangam.cart.vo.CartBean;
import com.mrporter.pomangam.common.pattern.vo.Status;
import com.mrporter.pomangam.common.util.Date;
import com.mrporter.pomangam.payment.dao.PaymentCrudDAO;
import com.mrporter.pomangam.payment.dao.PaymentIndexCrudDAO;
import com.mrporter.pomangam.payment.vo.PaymentBean;
import com.mrporter.pomangam.payment.vo.PaymentIndexBean;
import com.mrporter.pomangam.target.dao.DestinationCrudDAO;
import com.mrporter.pomangam.target.dao.OrdertimeCrudDAO;

@Controller
public class PaymentController {
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	private static final String MAPPINGNAME = "payment";
	private static PaymentCrudDAO defaultDAO = new PaymentCrudDAO();
	
	@RequestMapping(value = "/"+MAPPINGNAME+".do")
	public ModelAndView openIndexPage(
			@RequestParam(value = "direct", required = false) boolean direct,
			@RequestParam(value = "amount", required = false) Integer amount,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		Integer curTarget = null;
		Integer curRestaurant = null;
		Integer curProduct = null;
		try {
			curTarget = Integer.parseInt(session.getAttribute("curTarget")+"");
			curRestaurant = Integer.parseInt(session.getAttribute("curRestaurant")+"");
			curProduct = Integer.parseInt(session.getAttribute("curProduct")+"");
		} catch(Exception e) {
			response.sendRedirect("./");
			return null;
		}
		
		// 즉구
		if(direct) {
			if(amount==null || amount<1) {
				response.sendRedirect("./");
				return null;
			}
			CartBean bean = new CartBean(
					0, curTarget, curRestaurant, curProduct, amount);
			List<CartBean> directList = new ArrayList<>();
			directList.add(bean);
			request.setAttribute("directList", directList);
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("contents/" + MAPPINGNAME);
		model.addObject("destination", new DestinationCrudDAO().getListByIdx(curTarget));
		model.addObject("ordertime", new OrdertimeCrudDAO().getListByIdx(curTarget));
		
		return model;
	}
	
	@RequestMapping(value = "/paysuccess.do")
	public ModelAndView paysuccessPage(
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		Integer payNumber = (Integer) session.getAttribute("payNumber");
		session.removeAttribute("payNumber");
		
		ModelAndView model = new ModelAndView();
		try {
		model.setViewName("contents/paysuccess");
		model.addObject("payNumber", payNumber+"");
		model.addObject("payPassword", new PaymentIndexCrudDAO().getPW(payNumber));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/payerror.do")
	public ModelAndView payerrorPage() throws Exception {

		ModelAndView model = new ModelAndView();
		model.setViewName("contents/payerror");

		return model;
	}
	
	@RequestMapping(value = "/"+MAPPINGNAME+"/getlist.do", 
			produces = "application/json; charset=utf-8")
	public @ResponseBody String getList(
			@RequestParam(value = "tail", required = false) String tail) throws Exception {
		
		String list;
		if(tail == null) {
			list = defaultDAO.getList();
		} else {
			list = defaultDAO.getList(tail);
		}
		return list;
	}
	
	@RequestMapping(value = "/"+MAPPINGNAME+"/getbean.do", 
			produces = "application/json; charset=utf-8")
	public @ResponseBody String getBean(
			@RequestParam(value = "idx", required = false) Integer idx,
			@RequestParam(value = "column", required = false) String column,
			@RequestParam(value = "value", required = false) String value) throws Exception {

		String bean = null;
		if(idx != null) {
			bean = defaultDAO.getBean(idx);
		} else if(column!=null && value!=null) {
			bean = defaultDAO.getBean(column, value);
		}
		return bean;
	}
	
	@RequestMapping(value = "/"+MAPPINGNAME+"/insert.do", 
			produces = "application/json; charset=utf-8")
	public @ResponseBody Status insert(
			PaymentBean bean) throws Exception {
		
		bean.setTimestamp(Date.getCurDate());
		bean.setStatus(0); // 0 : 결제 대기, 1 : 결제 완료, 2 : 결제 실패
		
		Integer idx = defaultDAO.insert(bean);
		
		return new Status(200, idx+"");
	}
	
	@RequestMapping(value = "/"+MAPPINGNAME+"/insertindex.do", 
			produces = "application/json; charset=utf-8")
	public @ResponseBody Status insertIndex(
			PaymentIndexBean bean,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		Random rand = new Random();
		String pw = rand.nextInt(10) + "" + rand.nextInt(10);
		bean.setPassword(pw);
		Integer idx = new PaymentIndexCrudDAO().insert(bean);
		session.setAttribute("payNumber", idx);
		
		return new Status(200);
	}
	
	@RequestMapping(value = "/"+MAPPINGNAME+"/check.do", 
			produces = "application/json; charset=utf-8")
	public @ResponseBody Status check(
			@RequestParam(value = "PG_price", required = false) Integer PG_price,	// PG에서 승인된 금액
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		PaymentIndexCrudDAO indexDAO = new PaymentIndexCrudDAO();
		
		Integer idx = Integer.parseInt(session.getAttribute("payNumber")+"");
		
		if(indexDAO.check(idx, PG_price)) {
			// 금액 일치
			//response.sendRedirect("../paysuccess.do");
			return new Status(200);
		} else {
			// 금액 불일치
			indexDAO.transactionFail(idx);
			// pg취소
			// 관리자에게 알림
			//response.sendRedirect("../payerror.do");
			return new Status(400);
		}
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
