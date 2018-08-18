package com.mrporter.pomangam.product.controller;

import java.io.IOException;

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

import com.mrporter.pomangam.common.pattern.vo.Status;
import com.mrporter.pomangam.product.dao.ProductCrudDAO;

@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	private static final String MAPPINGNAME = "product"; 
	private static ProductCrudDAO defaultDAO = new ProductCrudDAO();
	
	@RequestMapping(value = "/"+MAPPINGNAME+".do")
	public ModelAndView openIndexPage(
			@RequestParam(value = "idx", required = false) Integer idx,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(idx==null||idx<0) {
			String curRestaurant = (String) session.getAttribute("curRestaurant");
			response.sendRedirect("./restaurant.do?idx="+curRestaurant);
			return null;
		}
		
		ModelAndView model = new ModelAndView();
		String product = defaultDAO.getBean(idx);
		
		if(product.equals("[]")) { // is empty
			String curRestaurant = (String) session.getAttribute("curRestaurant");
			response.sendRedirect("./restaurant.do?idx="+curRestaurant);
			return null;
		} else {
			model.setViewName("contents/" + MAPPINGNAME);
			model.addObject("product", product);
			model.addObject("recommend", defaultDAO.getRecommend(idx));
			session.setAttribute("curProduct", idx+"");
		}
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
	
	@ExceptionHandler
	public @ResponseBody Status handle(Exception e, HttpServletResponse response) {
		if(e.getClass().getSimpleName().equals("AccessDeniedException")) {
			try {
				response.sendRedirect("./denied"); 
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		logger.info("Exception Handler - " + e.getMessage());
		return new Status(400, "Exception handled!");
	}
	

}
