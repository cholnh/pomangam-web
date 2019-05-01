package com.mrporter.pomangam.target.controller;

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

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.login.dao.UserCrudDAO;
import com.mrporter.pomangam.common.pattern.vo.Status;
import com.mrporter.pomangam.common.security.model.domain.User;
import com.mrporter.pomangam.restaurant.dao.RestaurantCrudDAO;
import com.mrporter.pomangam.restaurant.vo.RestaurantBean;
import com.mrporter.pomangam.target.dao.TargetCrudDAO;
import com.mrporter.pomangam.target.vo.TargetAdBean;

@Controller
public class TargetController {
	
	private static final Logger logger = LoggerFactory.getLogger(TargetController.class);
	private static final String MAPPINGNAME = "target"; 
	private static TargetCrudDAO defaultDAO = new TargetCrudDAO();
	
	@RequestMapping(value = "/"+MAPPINGNAME+".do")
	public ModelAndView openIndexPage(
			@RequestParam(value = "idx", required = false) Integer idx,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(idx==null||idx<0) {
			response.sendRedirect("./");
			return null;
		}
		

		String preTarget = session.getAttribute("curTarget") + "";
		if(!preTarget.equals(idx+"")) {
			session.removeAttribute("cartList");
		}
		
		ModelAndView model = new ModelAndView();
		String target = defaultDAO.getBean(idx);
		List<RestaurantBean> restaurantList = new RestaurantCrudDAO().getBeanWithLimitCount(idx);
		List<TargetAdBean> targetAdList = new RestaurantCrudDAO().getAdList(idx);
		if(target.equals("[]")) { // is empty
			response.sendRedirect("./");
			return null;
		} else {
			
			model.setViewName("contents/" + MAPPINGNAME);
			model.addObject("target", target);
			model.addObject("restaurantList", restaurantList);
			model.addObject("targetAdList", targetAdList);
			
			Object obj = session.getAttribute("user");
			if(obj != null) {
				User user = new Gson().fromJson(obj+"", new TypeToken<User>() {}.getType()); 
				new UserCrudDAO().setTarget(user.getUsername(), idx);
			}
			session.setAttribute("curTarget", idx+"");
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
