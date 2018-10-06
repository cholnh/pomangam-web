package com.mrporter.pomangam.product.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.product.vo.ProductBean;
import com.mrporter.pomangam.restaurant.dao.RestaurantCrudDAO;

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
	
	public List<String> getCategoryList(Integer idx) throws Exception {
		List<String> result = new ArrayList<>();
		
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT category FROM product where idx_restaurant = ? group by category order by sequence", idx);
		if(!lom.isEmpty()) {
			Iterator<Map<String, Object>>  iter = lom.iterator();
			while(iter.hasNext()) {
				Map<String, Object> map = iter.next();
				result.add(map.get("category")+"");
			}
		}
		return result;
	}
	
	public static void main(String...args) {
		try {
			System.out.println(new ProductCrudDAO().getCategoryList(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<ProductBean> getBeanList(Integer idx, String category) throws Exception {
		List<ProductBean> result = null;
		
		String csql = "";
		if(category!=null&&category.length()!=0) {
			csql = "AND category = '" + category + "'";
		}
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT * FROM " + TABLENAME + " WHERE idx_restaurant= ? " + csql + " order by sequence", idx);
		if(!lom.isEmpty()) {
			Gson gson = new Gson();
			result = new Gson().fromJson(gson.toJson(lom), 
					new TypeToken<List<ProductBean>>() {}.getType());
		}
		return result;
	}
	
	public List<ProductBean> getRecommend(Integer idx) throws Exception {
		List<ProductBean> result = null;
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT p.idx, p.imgpath, p.name, p.price " +
				"FROM product p, product_recommend r " +
				"WHERE r.idx_product = ? AND p.idx = r.idx_product_recommend;", idx);
		if(!lom.isEmpty()) {
			Gson gson = new Gson();
			result = new Gson().fromJson(gson.toJson(lom), 
					new TypeToken<List<ProductBean>>() {}.getType());
		}
		return result;
	}
	
	public void addCountSell(Integer idx) throws Exception {
		
		List<Map<String, Object>> lom = 
				sqlQuery("SELECT idxes_payment FROM payment_index WHERE idx = ?;", idx);
		
		String[] idxes = (lom.get(0).get("idxes_payment")+"").split(",");
		for(String idx_payment : idxes) {
			List<Map<String, Object>> lom2 = 
					sqlQuery("SELECT idx_product, amount FROM payment WHERE idx = ?;", idx_payment);
			
			sqlUpdate("UPDATE product SET cnt_sell = cnt_sell + ? WHERE idx = ?", 
					lom2.get(0).get("amount"),
					lom2.get(0).get("idx_product"));
		}
	}
	
	public void resetCountSell() throws Exception {
		sqlUpdate("UPDATE product SET cnt_sell = 0");
	}
	
	public int getAmount(Integer idx_product, int minute) throws Exception {
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT " + 
					"TRUNCATE(?*unit_amount/unit_time, 0) - cnt_sell " + 
					"as amount " + 
				"FROM " + 
					"product " +
				"WHERE idx = ?;", minute, idx_product);
		int amount = Integer.parseInt(lom.get(0).get("amount")+"");
		return amount>0?amount:0;
	}
	
	public Calendar getTime(Integer idx_product, int amount, Integer idx_restaurant) throws Exception {
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT " + 
					"TRUNCATE(((?*unit_time/unit_amount) + " + 
					"(SELECT (cnt_sell*unit_time/unit_amount) FROM product WHERE idx = ?)) * 60, 0) " + 
					"as seconds " + 
				"FROM " + 
					"product " +
				"WHERE idx = ?;", amount, idx_product, idx_product);
		int seconds = Integer.parseInt(lom.get(0).get("seconds")+"");
		
		Calendar cur = Calendar.getInstance();
		Calendar start;
		Calendar end;
		String[] starttime = new RestaurantCrudDAO().getStartTime(idx_restaurant).split(":");
		String[] endtime = new RestaurantCrudDAO().getEndTime(idx_restaurant).split(":");
		int start_hour = Integer.parseInt(starttime[0]);
		int start_minute = Integer.parseInt(starttime[1]);
		int end_hour = Integer.parseInt(endtime[0]);
		int end_minute = Integer.parseInt(endtime[1]);
		start = Calendar.getInstance();
		start.set(Calendar.MINUTE, start_minute);
		if(start_hour>=12) {
			start.set(Calendar.AM_PM, Calendar.PM);
			start.set(Calendar.HOUR, start_hour-12);
		} else {
			start.set(Calendar.AM_PM, Calendar.AM);
			start.set(Calendar.HOUR, start_hour);
		}
		
		end = Calendar.getInstance();
		end.set(Calendar.MINUTE, end_minute-1);
		if(end_hour>=12) {
			end.set(Calendar.AM_PM, Calendar.PM);
			end.set(Calendar.HOUR, end_hour-12);
		} else {
			end.set(Calendar.AM_PM, Calendar.AM);
			end.set(Calendar.HOUR, end_hour);
		}
		
		// 종료시간
		if(cur.compareTo(end) > 0) {
			cur.set(Calendar.DATE, cur.get(Calendar.DATE)+1);
			cur.set(Calendar.HOUR, start.get(Calendar.HOUR));
			cur.set(Calendar.AM_PM, start.get(Calendar.AM_PM));
			cur.set(Calendar.MINUTE, start.get(Calendar.MINUTE));
		}
		
		// 시작시간
		if(cur.compareTo(start) < 0) {
			cur.set(Calendar.HOUR, start.get(Calendar.HOUR));
			cur.set(Calendar.AM_PM, start.get(Calendar.AM_PM));
			cur.set(Calendar.MINUTE, start.get(Calendar.MINUTE));
		}
		cur.add(Calendar.SECOND, seconds);
		
		Calendar next = getNext(cur, idx_restaurant);
		
		return next;
	}
	
	public Calendar getNext(Integer idx_restaurant) throws Exception {
		return getNext(Calendar.getInstance(), idx_restaurant);
	}
	
	public Calendar getNext(Calendar cal, Integer idx_restaurant) throws Exception {
	
		// 휴식시간 2시 ~ 4시
		Calendar pass_start = Calendar.getInstance();
		pass_start.set(Calendar.AM_PM, Calendar.PM);
		pass_start.set(Calendar.HOUR, 1);
		pass_start.set(Calendar.MINUTE, 29);
		
		Calendar pass_end = Calendar.getInstance();
		pass_end.set(Calendar.AM_PM, Calendar.PM);
		pass_end.set(Calendar.HOUR, 3);
		pass_end.set(Calendar.MINUTE, 30);
		
		if((cal.compareTo(pass_start) >= 0) && (cal.compareTo(pass_end) < 0)) {
			cal.set(Calendar.HOUR, 5);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			return cal;
		}
		
		// 휴식시간 7시 ~ 8시
		Calendar pass_start2 = Calendar.getInstance();
		pass_start2.set(Calendar.AM_PM, Calendar.PM);
		pass_start2.set(Calendar.HOUR, 6);
		pass_start2.set(Calendar.MINUTE, 29);
		
		Calendar pass_end2 = Calendar.getInstance();
		pass_end2.set(Calendar.AM_PM, Calendar.PM);
		pass_end2.set(Calendar.HOUR, 7);
		pass_end2.set(Calendar.MINUTE, 30);
		
		if((cal.compareTo(pass_start2) >= 0) && (cal.compareTo(pass_end2) < 0)) {
			cal.set(Calendar.HOUR, 9);
			cal.set(Calendar.MINUTE, 0);
			cal.set(Calendar.SECOND, 0);
			return cal;
		}
		
		// 첫 배달
		Calendar firstPorter = Calendar.getInstance();
		firstPorter.set(Calendar.HOUR, 11);
		firstPorter.set(Calendar.AM_PM, Calendar.AM);
		firstPorter.set(Calendar.MINUTE, 30);
		firstPorter.set(Calendar.DATE, cal.get(Calendar.DATE));
		
		if(cal.compareTo(firstPorter) < 0) {
			cal.set(Calendar.HOUR, firstPorter.get(Calendar.HOUR));
			cal.set(Calendar.AM_PM, firstPorter.get(Calendar.AM_PM));
			cal.set(Calendar.MINUTE, firstPorter.get(Calendar.MINUTE)-1);
		}
		
		cal.set(Calendar.SECOND, 0);
		if(cal.get(Calendar.MINUTE) >= 30) {
			cal.set(Calendar.HOUR, (cal.get(Calendar.HOUR)+1));
			cal.set(Calendar.MINUTE, 30);
		} else {
			cal.set(Calendar.MINUTE, 30);
		}
		
		cal.add(Calendar.MINUTE, 30); // 배달시간 +30분
		return cal;
	}
	
	/*
	public static void main(String...args) {
		ProductCrudDAO d = new ProductCrudDAO();

		for(int i=0; i<12; i++) {
			for(int j=0; j<60; j+=10) {
				Calendar cal = Calendar.getInstance();
				cal.set(Calendar.AM_PM, Calendar.AM);
				cal.set(Calendar.HOUR, i);
				cal.set(Calendar.MINUTE, j);
				
				System.out.println("cal : "+new Date(cal.getTimeInMillis()).toString());
				try {
					System.out.println("next : "+new Date(d.getNext(cal, 4).getTimeInMillis()).toString());
				} catch (Exception e) {
					e.printStackTrace();
				}
				System.out.println();
			}
		}
		
	}
	*/
}
