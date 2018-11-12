package com.mrporter.pomangam.product.controller;

import java.io.IOException;
import java.util.Calendar;

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
import com.mrporter.pomangam.product.dao.AdditionalCrudDAO;
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
		
		@SuppressWarnings("unused")
		Integer curTarget = null;
		Integer curRestaurant = null;
		try {
			curTarget = Integer.parseInt(session.getAttribute("curTarget")+"");
			curRestaurant = Integer.parseInt(session.getAttribute("curRestaurant")+"");
		} catch(Exception e) {
			response.sendRedirect("./");
			return null;
		}
		
		if(idx==null||idx<0) {
			response.sendRedirect("./restaurant.do?idx="+curRestaurant);
			return null;
		}
		
		ModelAndView model = new ModelAndView();
		String product = defaultDAO.getBean(idx);
		
		if(product.equals("[]")) { // is empty
			response.sendRedirect("./restaurant.do?idx="+curRestaurant);
			return null;
		} else {
			model.setViewName("contents/" + MAPPINGNAME);
			model.addObject("product", product);
			model.addObject("recommend", defaultDAO.getRecommend(idx));
			model.addObject("additionalList", new AdditionalCrudDAO().getListByIdxProduct(idx));
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
	
	@RequestMapping(value = "/"+MAPPINGNAME+"/gettime.do", 
			produces = "application/json; charset=utf-8")
	public @ResponseBody long getTime(
			@RequestParam(value = "idx_product", required = false) Integer idx_product,
			@RequestParam(value = "amount", required = false) Integer amount,
			@RequestParam(value = "idx_restaurant", required = false) Integer idx_restaurant) throws Exception {

		Calendar cal = new ProductCrudDAO().getTime(Calendar.getInstance(), idx_product, amount, idx_restaurant);
		if(cal == null) {
			return -1;
		} else {
			return cal.getTimeInMillis();
		}
	}
	
	@RequestMapping(value = "/"+MAPPINGNAME+"/getmaxtime.do", 
			produces = "application/json; charset=utf-8")
	public @ResponseBody long getMaxTime(
			@RequestParam(value = "products", required = false) String products) throws Exception {
		
		long max = 0;
		String[] productList = products.split(",");
		for(String obj : productList) {
			int idx_product = Integer.parseInt(obj.split("-")[0]);
			int amount = Integer.parseInt(obj.split("-")[1]);
			int idx_restaurant = Integer.parseInt(obj.split("-")[2]);
			
			long millis = new ProductCrudDAO().getTime(Calendar.getInstance(), idx_product, amount, idx_restaurant).getTimeInMillis();
			max = max < millis ? millis : max;
		}
		return max;
	}
	
	public static void main(String...args){
		for(int i=28; i<=36; i++) {
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '주먹김밥', 2000);");
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '계란찜', 2000);");
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '치즈', 3000);");
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '계란(2알)', 1500);");
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '떡', 1000);");
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '오뎅', 1000);");
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '순대', 3000);");
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '우동사리', 2000);");
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '당면사리', 2000);");
			System.out.println("INSERT INTO product_additional (`idx_product`, `name`, `price`) VALUES ("+i+", '모듬튀김', 2000);");
			
		}
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
				String curRestaurant = (String) session.getAttribute("curRestaurant");
				response.sendRedirect("./restaurant.do?idx="+curRestaurant);
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		logger.info("Exception Handler - " + e.getMessage());
		return new Status(400, "Exception handled!");
	}
	

}
