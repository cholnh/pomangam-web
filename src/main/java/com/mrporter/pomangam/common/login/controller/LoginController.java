package com.mrporter.pomangam.common.login.controller;

import java.io.IOException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.login.dao.UserCrudDAO;
import com.mrporter.pomangam.common.login.vo.UserBean;
import com.mrporter.pomangam.common.pattern.vo.Status;
import com.mrporter.pomangam.common.security.model.UserService;
import com.mrporter.pomangam.common.security.model.domain.User;
import com.mrporter.pomangam.common.util.Ip;


@Controller
public class LoginController {
	@Autowired
    UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private static final int KEY_SIZE = 1024;
	   
	@RequestMapping(value = "/login.do")
	public ModelAndView openIndexPage(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) 
			throws Exception {
		//logger.info("login index - " + error);

		ModelAndView model = new ModelAndView();

		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(!authentication.getName().equals("anonymousUser")) {
			response.sendRedirect("./"); 
		}
		*/
		
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
		} else {
			response.sendRedirect("./"); 
		}
		
		if (error != null) {
			model.addObject("error", "입력한 아이디와 비밀번호가 일치하지 않습니다.");
		}
		if (logout != null) {
			model.addObject("msg", "성공적으로 로그아웃 되었습니다.");
		}
		
		setRSA(request, KEY_SIZE);
		
		model.setViewName("contents/login");
		return model;
	}

	
	@RequestMapping(value = "/logout.do")
	public void logout(
			@RequestParam(value = "data", required = false) String data,
			final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		//logger.info("logout");
		
		HttpSession session= request.getSession(false);
		SecurityContextHolder.clearContext();
		session= request.getSession(false);
		if(session != null) {
			String username = "";
			Object obj = session.getAttribute("user");
			if(obj != null) {
				User user = new Gson().fromJson(obj+"", new TypeToken<User>() {}.getType());
				username = user.getUsername();
			}
			session.removeAttribute("user");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if ( loginCookie != null ){
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                 
                Date session_limit = new Date(System.currentTimeMillis());
                new UserCrudDAO().rememberSession(session.getId(), session_limit, username);
            }
		}
		/*
		for(Cookie cookie : request.getCookies()) {
			cookie.setMaxAge(0);
		}
		*/
		
		response.sendRedirect("./login.do?logout=true"); 
	}

	@RequestMapping(value = "/signup.do")
	public ModelAndView signup(
			@RequestParam(value = "form_username", required = false) String username,
			@RequestParam(value = "form_password", required = false) String password,
			@RequestParam(value = "form_name", required = false) String name,
			@RequestParam(value = "form_tel", required = false) String tel,
			final HttpServletResponse response) throws Exception {
		
		if(username==null || password==null || name==null || tel==null) {
			response.sendRedirect("./login.do"); 
		}
		
		UserBean bean = new UserBean();
		bean.setUsername(username);
		bean.setPassword(password);
		bean.setName(name);
		bean.setTel(tel);
		bean.setRegdate(com.mrporter.pomangam.common.util.Date.getCurDate());
		new UserCrudDAO().insert(bean);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("contents/signup");
		model.addObject("username", username);
		model.addObject("name", name);
		return model;
	}
	
	@RequestMapping(value = "/login/check.do")
	public @ResponseBody boolean check(
			@RequestParam(value = "username", required = true) String username) throws Exception {
		UserCrudDAO userDAO = new UserCrudDAO();
		return userDAO.idDuplicated("username", username);
	}
	
	@RequestMapping(value = "/oauth/login.do")
	public ModelAndView oauthLogin(
			@RequestParam(value = "username", required = true) String username) throws Exception {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("contents/signup");
		return model;
	}
	
	
	@RequestMapping(value = "/denied")
	public ModelAndView denied(
			@RequestParam(value = "data", required = false) String data,
			final HttpServletResponse response) throws Exception {
		logger.info("denied - " + Ip.getInfo());

		ModelAndView model = new ModelAndView();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication.getName().equals("anonymousUser")) {
			response.sendRedirect("./login.do"); 
		}
		model.setViewName("contents/denied");
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
		logger.info("Exception Handler - " + e.getMessage());
		return new Status(400, "Exception handled!");
	}
	
	private void setRSA(HttpServletRequest request, final int KEY_SIZE) throws Exception {
    	request.setCharacterEncoding("UTF-8");

    	HttpSession session = request.getSession();
    	
        KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
        generator.initialize(KEY_SIZE);

        KeyPair keyPair = generator.genKeyPair();
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");

        PublicKey publicKey = keyPair.getPublic();
        PrivateKey privateKey = keyPair.getPrivate();

        session.setAttribute("__rsaPrivateKey__", privateKey);

        RSAPublicKeySpec publicSpec = 
        		(RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

        String publicKeyModulus = publicSpec.getModulus().toString(16);
        String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

        request.setAttribute("publicKeyModulus", publicKeyModulus);
        request.setAttribute("publicKeyExponent", publicKeyExponent);
	}
}
