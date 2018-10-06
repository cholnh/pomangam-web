	package com.mrporter.pomangam.restaurant.controller;

import java.io.IOException;
import java.util.List;

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
import com.mrporter.pomangam.product.vo.ProductBean;
import com.mrporter.pomangam.restaurant.dao.RestaurantCrudDAO;

@Controller
public class RestaurantController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	private static final String MAPPINGNAME = "restaurant"; 
	private static RestaurantCrudDAO defaultDAO = new RestaurantCrudDAO();
	
	@RequestMapping(value = "/"+MAPPINGNAME+".do")
	public ModelAndView openIndexPage(
			@RequestParam(value = "idx", required = false) Integer idx,
			@RequestParam(value = "category", required = false) String category,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		Integer curTarget = null;
		try {
			Integer.parseInt(idx+"");
			curTarget = Integer.parseInt(session.getAttribute("curTarget")+"");
		} catch(Exception e) {
			response.sendRedirect("./");
			return null;
		}
		
		if(idx==null||idx<0) {
			response.sendRedirect("./target.do?idx="+curTarget); 
			return null;
		}
		ProductCrudDAO pDAO = new ProductCrudDAO();
		
		ModelAndView model = new ModelAndView();
		String restaurant = defaultDAO.getBean(idx);
		List<ProductBean> productList = pDAO.getBeanList(idx, category);
		List<String> categoryList = pDAO.getCategoryList(idx);
		
		if(restaurant.equals("[]")) { // is empty
			response.sendRedirect("./target.do?idx="+curTarget);
			return null;
		} else {
			model.setViewName("contents/" + MAPPINGNAME);
			model.addObject("restaurant", restaurant);
			model.addObject("productList", productList);
			model.addObject("categoryList", categoryList);
			model.addObject("category", category);
			session.setAttribute("curRestaurant", idx+"");
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
	public @ResponseBody Status handle(Exception e, HttpServletRequest request, HttpServletResponse response) {
		if(e.getClass().getSimpleName().equals("AccessDeniedException")) {
			try {
				response.sendRedirect("./denied"); 
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		if(e.getClass().getSimpleName().equals("MethodArgumentTypeMismatchException")) {
			try {
				HttpSession session = request.getSession();
				String curTarget = (String )session.getAttribute("curTarget");
				response.sendRedirect("./target.do?idx="+curTarget); 
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		logger.info("Exception Handler - " + e.getMessage());
		return new Status(400, "Exception handled!");
	}
	

}
