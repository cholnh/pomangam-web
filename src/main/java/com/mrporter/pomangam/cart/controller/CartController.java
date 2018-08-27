package com.mrporter.pomangam.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import com.mrporter.pomangam.cart.dao.CartCrudDAO;
import com.mrporter.pomangam.cart.vo.CartBean;
import com.mrporter.pomangam.common.pattern.vo.Status;

@Controller
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	private static final String MAPPINGNAME = "cart"; 
	private static CartCrudDAO defaultDAO = new CartCrudDAO();
	
	@RequestMapping(value = "/"+MAPPINGNAME+".do")
	public ModelAndView openIndexPage() throws Exception {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("contents/" + MAPPINGNAME);
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/"+MAPPINGNAME+"/insert.do")
	public @ResponseBody Status insert(
			CartBean bean,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		List<CartBean> cartList = null;
		Object obj = session.getAttribute("cartList");
		
		if(obj==null) {
			cartList = new ArrayList<>();
		} else {
			cartList = (ArrayList<CartBean>) obj;
		}
		
		for(CartBean c : cartList) {
			if(c.getIdx_product().intValue() == bean.getIdx_product().intValue()) {
				c.setAmount(c.getAmount().intValue() + bean.getAmount().intValue());
				return new Status(200);
			}
		}
		
		bean.setIdx(cartList.size());
		cartList.add(bean);
		session.setAttribute("cartList", cartList);
		
		return new Status(200);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/"+MAPPINGNAME+"/update.do")
	public @ResponseBody Status update(
			@RequestParam(value = "idx", required = true) Integer idx,
			@RequestParam(value = "amount", required = true) Integer amount,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		List<CartBean> cartList = null;
		Object obj = session.getAttribute("cartList");
		
		if(obj==null) {
		} else {
			cartList = (ArrayList<CartBean>) obj;
			for(CartBean c : cartList) {
				//System.out.println(c);
				if(c.getIdx().intValue() == idx.intValue()) {
					c.setAmount(amount);
					session.setAttribute("cartList", cartList);
					return new Status(200);
				}
			}
		}
		return new Status(200);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/"+MAPPINGNAME+"/delete.do")
	public @ResponseBody Status delete(
			@RequestParam(value = "idx", required = true) Integer idx,
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		List<CartBean> cartList = null;
		Object obj = session.getAttribute("cartList");
		
		if(obj==null) {
		} else {
			cartList = (ArrayList<CartBean>) obj;
			for(CartBean c : cartList) {
				if(c.getIdx().intValue() == idx.intValue()) {
					cartList.remove(c);
					session.setAttribute("cartList", cartList);
					return new Status(200);
				}
			}
		}
		return new Status(200);
	}
	
	@RequestMapping(value = "/"+MAPPINGNAME+"/alldelete.do")
	public @ResponseBody Status deleteAll(
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.removeAttribute("cartList");

		return new Status(200);
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
