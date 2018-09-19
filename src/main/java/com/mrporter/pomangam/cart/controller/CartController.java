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

import com.mrporter.pomangam.cart.vo.CartBean;
import com.mrporter.pomangam.common.pattern.vo.Status;

@Controller
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	private static final String MAPPINGNAME = "cart"; 
	
	@RequestMapping(value = "/"+MAPPINGNAME+".do")
	public ModelAndView openIndexPage() throws Exception {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("contents/" + MAPPINGNAME);
		return model;
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
		
		if((bean.getAdditional()==null || bean.getAdditional().length()<=0) && (bean.getRequirement()==null || bean.getRequirement().length() <=0)) {
			for(CartBean c : cartList) {
				if((c.getAdditional()!=null && c.getAdditional().length()>0) || (c.getRequirement()!=null && c.getRequirement().length()>0)) {
					continue;
				}
				if(c.getIdx_product().intValue() == bean.getIdx_product().intValue()) {
					c.setAmount(c.getAmount().intValue() + bean.getAmount().intValue());
					return new Status(200);
				}
			}
			//System.out.println("^^");
		}
		/*
		List<AdditionalCrudDAO> additionalList = null;
		String add = bean.getAdditional();
		if(add == null || add.length()>0) {
			additionalList = new ArrayList<>();
			AdditionalCrudDAO aDAO = new AdditionalCrudDAO();
			String[] parts = add.split(",");
			for(String part : parts) {
				Integer idx_product_additional = Integer.parseInt(part.split("-")[0]);
				Integer amount = Integer.parseInt(part.split("-")[1]);
				
			}
			
		}
		*/
		
		
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
