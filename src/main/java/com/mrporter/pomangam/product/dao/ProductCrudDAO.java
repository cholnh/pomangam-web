package com.mrporter.pomangam.product.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
				"SELECT category FROM product where idx_restaurant = ? AND isActive = 1 group by category order by sequence", idx);
		if(!lom.isEmpty()) {
			Iterator<Map<String, Object>>  iter = lom.iterator();
			while(iter.hasNext()) {
				Map<String, Object> map = iter.next();
				Object obj = map.get("category");
				if(obj != null) {
					result.add(obj+"");
				}
			}
		}
		return result;
	}
	/*
	public static void main(String...args) {
		try {
			System.out.println(new ProductCrudDAO().getCategoryList(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	*/
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
					sqlQuery("SELECT idx_restaurant, amount FROM payment WHERE idx = ?;", idx_payment);
			
			sqlUpdate("UPDATE restaurant SET cnt_sell = cnt_sell + ? WHERE idx = ?", 
					lom2.get(0).get("amount"),
					lom2.get(0).get("idx_restaurant"));
		}
	}
	
	public void resetCountSell() throws Exception {
		sqlUpdate("UPDATE restaurant SET cnt_sell = 0");
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
	
	public Calendar getTime(Calendar cur, Integer idx_product, int amount, Integer idx_restaurant) throws Exception {
		List<Map<String, Object>> lom = sqlQuery(
				"SELECT " + 
					"TRUNCATE(((?*unit_time/unit_amount) + " + 
					"(SELECT (cnt_sell*unit_time/unit_amount) FROM restaurant WHERE idx = ?)) * 60, 0) " + 
					"as seconds " + 
				"FROM " + 
					"restaurant " +
				"WHERE idx = ?;", amount, idx_restaurant, idx_restaurant);
		int seconds = Integer.parseInt(lom.get(0).get("seconds")+"");
		
		Calendar start;
		Calendar end;
		String[] starttime = new RestaurantCrudDAO().getStartTime(idx_restaurant).split(":");
		String[] endtime = new RestaurantCrudDAO().getEndTime(idx_restaurant).split(":");
				
		int start_hour = Integer.parseInt(starttime[0]);
		int start_minute = Integer.parseInt(starttime[1]);
		int end_hour = Integer.parseInt(endtime[0]);
		int end_minute = Integer.parseInt(endtime[1]);
		start = Calendar.getInstance();
		start.set(Calendar.SECOND, 0);
		start.set(Calendar.MINUTE, start_minute);
		if(start_hour>=12) {
			start.set(Calendar.AM_PM, Calendar.PM);
			start.set(Calendar.HOUR, start_hour-12);
		} else {
			start.set(Calendar.AM_PM, Calendar.AM);
			start.set(Calendar.HOUR, start_hour);
		}
		end = Calendar.getInstance();
		end.set(Calendar.SECOND, 0);
		end.set(Calendar.MINUTE, end_minute-1);
		if(end_hour>=12) {
			end.set(Calendar.AM_PM, Calendar.PM);
			end.set(Calendar.HOUR, end_hour-12);
		} else {
			end.set(Calendar.AM_PM, Calendar.AM);
			end.set(Calendar.HOUR, end_hour);
		}
		
		cur.add(Calendar.SECOND, seconds);
		
		
		/* 이삭토스트 커스텀 시간 시작 
		if(idx_restaurant == 15) {
			Calendar pass_start = Calendar.getInstance();
			pass_start.set(Calendar.AM_PM, Calendar.PM);
			pass_start.set(Calendar.HOUR, 12);
			pass_start.set(Calendar.MINUTE, 30);
			
			Calendar pass_end = Calendar.getInstance();
			pass_end.set(Calendar.AM_PM, Calendar.PM);
			pass_end.set(Calendar.HOUR, 4);
			pass_end.set(Calendar.MINUTE, 30);
			
			if(cur.compareTo(pass_start) < 0) {
				cur.set(Calendar.HOUR, 1);
				cur.set(Calendar.AM_PM, Calendar.PM);
				cur.set(Calendar.MINUTE, 0);
				cur.set(Calendar.SECOND, 0);
				return cur;
			} else if((cur.compareTo(pass_start) >= 0) && (cur.compareTo(pass_end) < 0)) {
				cur.set(Calendar.HOUR, 5);
				cur.set(Calendar.AM_PM, Calendar.PM);
				cur.set(Calendar.MINUTE, 0);
				cur.set(Calendar.SECOND, 0);
				return cur;
			} else if(cur.compareTo(pass_end) >= 0) {
				cur.add(Calendar.DATE, 1);
				cur.set(Calendar.HOUR, 1);
				cur.set(Calendar.AM_PM, Calendar.PM);
				cur.set(Calendar.MINUTE, 0);
				cur.set(Calendar.SECOND, 0);
				return cur;
			}
			
		}
		 이삭토스트 커스텀 시간 끝 */
		
		int curWeek = cur.get(Calendar.DAY_OF_WEEK);
		if( curWeek==Calendar.SUNDAY || curWeek==Calendar.SATURDAY ) {
			// 주말
			
			/*
			// 종료시간
			Calendar holy_end = Calendar.getInstance();
			holy_end.set(Calendar.DATE, cur.get(Calendar.DATE));
			holy_end.set(Calendar.AM_PM, Calendar.PM);
			holy_end.set(Calendar.HOUR, 6);
			holy_end.set(Calendar.MINUTE, 0);
			
			if(cur.compareTo(holy_end) >= 0) {
				cur.add(Calendar.DATE, 1);
				cur.set(Calendar.HOUR, start.get(Calendar.HOUR));
				cur.set(Calendar.AM_PM, start.get(Calendar.AM_PM));
				cur.set(Calendar.MINUTE, start.get(Calendar.MINUTE));
				cur.set(Calendar.SECOND, 0);
			}
			
			// 시작시간			
			if(cur.compareTo(start) < 0) {
				cur.set(Calendar.HOUR, start.get(Calendar.HOUR));
				cur.set(Calendar.AM_PM, start.get(Calendar.AM_PM));
				cur.set(Calendar.MINUTE, start.get(Calendar.MINUTE));
				cur.set(Calendar.SECOND, 0);
			}
			*/
			
			// 종료시간
			if(cur.compareTo(end) >= 0) {
				cur.add(Calendar.DATE, 1);
				cur.set(Calendar.HOUR, start.get(Calendar.HOUR));
				cur.set(Calendar.AM_PM, start.get(Calendar.AM_PM));
				cur.set(Calendar.MINUTE, start.get(Calendar.MINUTE));
				cur.set(Calendar.SECOND, 0);
			}
			
			// 시작시간
			if(cur.compareTo(start) < 0) {
				cur.set(Calendar.HOUR, start.get(Calendar.HOUR));
				cur.set(Calendar.AM_PM, start.get(Calendar.AM_PM));
				cur.set(Calendar.MINUTE, start.get(Calendar.MINUTE));
				cur.set(Calendar.SECOND, 0);
			}
			
		} else {
			// 평일
			
			// 종료시간
			if(cur.compareTo(end) >= 0) {
				cur.add(Calendar.DATE, 1);
				cur.set(Calendar.HOUR, start.get(Calendar.HOUR));
				cur.set(Calendar.AM_PM, start.get(Calendar.AM_PM));
				cur.set(Calendar.MINUTE, start.get(Calendar.MINUTE));
				cur.set(Calendar.SECOND, 0);
			}
			
			// 시작시간
			if(cur.compareTo(start) < 0) {
				cur.set(Calendar.HOUR, start.get(Calendar.HOUR));
				cur.set(Calendar.AM_PM, start.get(Calendar.AM_PM));
				cur.set(Calendar.MINUTE, start.get(Calendar.MINUTE));
				cur.set(Calendar.SECOND, 0);
			}
		}
		
		Calendar next = getNext(cur, idx_restaurant);
		
		return next;
	}
	
	public Calendar getNext(Integer idx_restaurant) throws Exception {
		return getNext(Calendar.getInstance(), idx_restaurant);
	}
	
	public Calendar getNext(Calendar cal, Integer idx_restaurant) throws Exception {
	
		int curWeek = cal.get(Calendar.DAY_OF_WEEK);
		if( curWeek==Calendar.SUNDAY || curWeek==Calendar.SATURDAY ) {
			// 주말
			//System.out.println("주말");
			
			/*
			// 첫 주문 마감
			Calendar firstorder = Calendar.getInstance();
			firstorder.set(Calendar.DATE, cal.get(Calendar.DATE));
			firstorder.set(Calendar.AM_PM, Calendar.PM);
			firstorder.set(Calendar.HOUR, 0);
			firstorder.set(Calendar.MINUTE, 0);
			
			if(cal.compareTo(firstorder) < 0) {
				cal.set(Calendar.AM_PM, Calendar.PM);
				cal.set(Calendar.HOUR, 0);
				cal.set(Calendar.MINUTE, 30);
				cal.set(Calendar.SECOND, 0);
				return cal;
			}
			
			// 휴식시간 12시 30분 ~ 17시 30분
			Calendar pass_end = Calendar.getInstance();
			pass_end.set(Calendar.DATE, cal.get(Calendar.DATE));
			pass_end.set(Calendar.AM_PM, Calendar.PM);
			pass_end.set(Calendar.HOUR, 6);
			pass_end.set(Calendar.MINUTE, 0);
			
			if((cal.compareTo(firstorder) >= 0) && (cal.compareTo(pass_end) < 0)) {
				cal.set(Calendar.AM_PM, Calendar.PM);
				cal.set(Calendar.HOUR, 6);
				cal.set(Calendar.MINUTE, 30);
				cal.set(Calendar.SECOND, 0);
				return cal;
			}
			
			return cal;
			*/
			
			
			// 휴식시간 2시 ~ 4시  <-- 이부분만 평일과 다른 로직임
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
			// end 
			
			/*
			// 휴식시간 7시 ~ 8시
			Calendar pass_start2 = Calendar.getInstance();
			pass_start2.set(Calendar.AM_PM, Calendar.PM);
			pass_start2.set(Calendar.HOUR, 6);
			pass_start2.set(Calendar.MINUTE, 30);
			pass_start2.set(Calendar.SECOND, 0);
			
			Calendar pass_end2 = Calendar.getInstance();
			pass_end2.set(Calendar.AM_PM, Calendar.PM);
			pass_end2.set(Calendar.HOUR, 7);
			pass_end2.set(Calendar.MINUTE, 30);
			pass_end2.set(Calendar.SECOND, 0);
			
			//System.out.println("cur : "+new Date(cal.getTimeInMillis()).toString());
			//System.out.println("pass_start2 : "+new Date(pass_start2.getTimeInMillis()).toString());
			
			if((cal.compareTo(pass_start2) >= 0) && (cal.compareTo(pass_end2) < 0)) {
				cal.set(Calendar.HOUR, 9);
				cal.set(Calendar.MINUTE, 0);
				cal.set(Calendar.SECOND, 0);
				return cal;
			}
			*/
			
			// 첫 배달
			Calendar firstPorter = Calendar.getInstance();
			firstPorter.setTime(cal.getTime());
			firstPorter.set(Calendar.HOUR, 11);
			firstPorter.set(Calendar.AM_PM, Calendar.AM);
			firstPorter.set(Calendar.MINUTE, 30);
			//firstPorter.set(Calendar.MONTH, cal.get(Calendar.MONTH));
			//firstPorter.set(Calendar.DATE, cal.get(Calendar.DATE));
			
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
			
		} else {
			// 평일
			//System.out.println("평일");
			
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
			
			/*
			// 휴식시간 7시 ~ 8시
			Calendar pass_start2 = Calendar.getInstance();
			pass_start2.set(Calendar.AM_PM, Calendar.PM);
			pass_start2.set(Calendar.HOUR, 6);
			pass_start2.set(Calendar.MINUTE, 30);
			pass_start2.set(Calendar.SECOND, 0);
			
			Calendar pass_end2 = Calendar.getInstance();
			pass_end2.set(Calendar.AM_PM, Calendar.PM);
			pass_end2.set(Calendar.HOUR, 7);
			pass_end2.set(Calendar.MINUTE, 30);
			pass_end2.set(Calendar.SECOND, 0);
			
			//System.out.println("cur : "+new Date(cal.getTimeInMillis()).toString());
			//System.out.println("pass_start2 : "+new Date(pass_start2.getTimeInMillis()).toString());
			
			if((cal.compareTo(pass_start2) >= 0) && (cal.compareTo(pass_end2) < 0)) {
				cal.set(Calendar.HOUR, 9);
				cal.set(Calendar.MINUTE, 0);
				cal.set(Calendar.SECOND, 0);
				return cal;
			}
			*/
			
			// 첫 배달
			Calendar firstPorter = Calendar.getInstance();
			firstPorter.setTime(cal.getTime());
			firstPorter.set(Calendar.HOUR, 11);
			firstPorter.set(Calendar.AM_PM, Calendar.AM);
			firstPorter.set(Calendar.MINUTE, 30);
			//firstPorter.set(Calendar.MONTH, cal.get(Calendar.MONTH));
			//firstPorter.set(Calendar.DATE, cal.get(Calendar.DATE));
			
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
	}
	
	public static void main(String...args) {
		try {
			ProductCrudDAO d = new ProductCrudDAO();
	
			//Calendar cur = Calendar.getInstance();
			//System.out.println("cur : "+new Date(cur.getTimeInMillis()).toString());
			
			final int idx_restaurant = 9;	// 맘스터치
			final int idx_product = 1;		// 화이트갈릭버거
			final int amount = 1;			// 개수
			
			
			for(int i=0; i<=12; i++) {
				for(int j=0; j<60; j=j+5) {
					Calendar cur = Calendar.getInstance();
					//cur.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
					//cur.add(Calendar.DATE, 2);
					cur.set(Calendar.AM_PM, Calendar.PM);
					cur.set(Calendar.HOUR, i);
					cur.set(Calendar.MINUTE, j);
					System.out.println("cur "+new Date(cur.getTimeInMillis()).toString());
					
					System.out.println("return : "+new Date(
							d.getTime(cur, idx_product, amount, idx_restaurant)
								.getTimeInMillis()).toString());
						
					System.out.println();
				}
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
