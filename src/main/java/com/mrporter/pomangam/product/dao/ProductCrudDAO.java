package com.mrporter.pomangam.product.dao;

import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.product.vo.ProductBean;

/**
 * ProductCrudDAO
 * 
 * @version 1.0 [2018. 8. 15.]
 * @author Choi
 */
public class ProductCrudDAO extends Crud<ProductBean> {
	private static final String TABLENAME = "product"; 
	
	/**
	 * @param tableName
	 */
	public ProductCrudDAO() {
		super(TABLENAME);
	}
}
