package com.mrporter.pomangam.common.index;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.google.gson.Gson;
import com.mrporter.pomangam.common.login.dao.UserCrudDAO;
import com.mrporter.pomangam.common.login.vo.UserBean;
import com.mrporter.pomangam.common.pattern.vo.Status;
import com.mrporter.pomangam.common.security.model.UserService;
import com.mrporter.pomangam.common.security.model.domain.User;
import com.mrporter.pomangam.payment.dao.PaymentIndexCrudDAO;
import com.mrporter.pomangam.restaurant.dao.RestaurantCrudDAO;
import com.mrporter.pomangam.target.dao.TargetCrudDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	@Autowired
    UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView openDefaultPage(HttpServletRequest request) throws Exception {
		//logger.info("Welcome home!");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		if(obj == null) {
			Cookie cookie = WebUtils.getCookie(request, "loginCookie");
			if(cookie != null) {
				String session_key = cookie.getValue();
				//System.out.println("session_key : " + session_key);
				UserBean bean = new UserCrudDAO().getMemberWithSession(session_key);
				if(bean != null) {
					User user = userService.loadUserByUsername(bean.getUsername());
					user.setPassword("");
		            session.setAttribute("user", new Gson().toJson(user));
				}
			}
		}
		
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
	public ModelAndView openIndexPage(HttpServletRequest request) throws Exception {
		return openDefaultPage(request);
	}

	@RequestMapping(value = "/privacy.do")
	public ModelAndView privacyPage() throws Exception {
		ModelAndView model = new ModelAndView();
		model.setViewName("contents/privacy");
		return model;
	}
	
	@RequestMapping(value = "/terms.do")
	public ModelAndView termsPage() throws Exception {
		ModelAndView model = new ModelAndView();
		model.setViewName("contents/terms");
		return model;
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
