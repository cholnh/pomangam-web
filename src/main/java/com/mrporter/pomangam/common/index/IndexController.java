package com.mrporter.pomangam.common.index;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrporter.pomangam.common.pattern.vo.Status;
import com.mrporter.pomangam.payment.dao.PaymentIndexCrudDAO;
import com.mrporter.pomangam.restaurant.dao.RestaurantCrudDAO;
import com.mrporter.pomangam.target.dao.TargetCrudDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView openDefaultPage() throws Exception {
		logger.info("Welcome home!");
		
		ModelAndView model = new ModelAndView();
		model.setViewName("contents/index");
		
		TargetCrudDAO targetDAO = new TargetCrudDAO();
		RestaurantCrudDAO restaurantDAO = new RestaurantCrudDAO();
		PaymentIndexCrudDAO indexDAO = new PaymentIndexCrudDAO();
		
		model.addObject("sumOrder", targetDAO.getSumOrder());
		model.addObject("todayOrder", indexDAO.getTodayOrder());
		model.addObject("targetList", targetDAO.getBeanList());
		model.addObject("sumRestaurant", restaurantDAO.getBeanList().size());
		
		return model;
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public ModelAndView openIndexPage() throws Exception {
		return openDefaultPage();
	}
	
	@ExceptionHandler
	public @ResponseBody Status handle(Exception e, HttpServletResponse response) {
		if(e.getClass().getSimpleName().equals("AccessDeniedException")) {
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
