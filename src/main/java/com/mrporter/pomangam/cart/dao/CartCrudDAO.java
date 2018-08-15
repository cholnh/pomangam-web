package com.mrporter.pomangam.cart.dao;

import com.mrporter.pomangam.cart.vo.CartBean;
import com.mrporter.pomangam.common.pattern.dao.Crud;

/**
 * CartCrudDAO
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
public class CartCrudDAO extends Crud<CartBean> {
	private static final String TABLENAME = "cart"; 
	
	/**
	 * @param tableName
	 */
	public CartCrudDAO() {
		super(TABLENAME);
	}
}
