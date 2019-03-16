package com.mrporter.pomangam.payment.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.common.util.Date;
import com.mrporter.pomangam.payment.vo.PaymentIndexBean;

/**
 * PaymentIndexCrudDAO
 * 
 * @version 1.0 [2018. 8. 19.]
 * @author Choi
 */
public class PaymentIndexCrudDAO extends Crud<PaymentIndexBean> {
	private static final Logger logger = LoggerFactory.getLogger(PaymentIndexCrudDAO.class);
	private static final String TABLENAME = "payment_index"; 
	
	/**
	 * @param tableName
	 */
	public PaymentIndexCrudDAO() {
		super(TABLENAME);
	}
	
	public void sendOrderMsg(Integer idx) throws Exception {
		String phone_number = "821064784899";
		String tmplId = "pmg_order_info_1";
		
		String username = "최낙형";
		int orderQuantity = 2;
		String orderStatus = "예약완료";
		int orderNum = 12;
		String receive_date = "3/12 화요일";
		String receive_time = "18";
		String subinfo = "기숙사의 경우 10분 정도 차이가 날 수 있습니다.";
		String orderInfo = 	"① 피자스쿨 (02-1234-1234)\n" +
							"    - 불고기피자 (1개)\n" +
							"    - 콜라(1.25L) (1개)\n" +
							"② 맘스터치 (02-1234-1234)\n" +
							"    - 싸이버거 세트 (2개)";
		String bank_name = "카카오뱅크";
		String bank_account = "3333-05-8294394";
		String bank_username = "최낙형";
		int totalprice = 21000;
		
		String text = 
				"[포만감 주문안내]" + System.lineSeparator() +
				username + "님의 주문 " + orderQuantity + "건이 '" + orderStatus + "'되었습니다." + System.lineSeparator() +
				"▷ 주문번호 : " + orderNum + "번" + System.lineSeparator() +
				"▷ 도착시간 : " + receive_time + "시 (" + receive_date + ")" + System.lineSeparator() +
				"※ " + subinfo  + System.lineSeparator() + System.lineSeparator() +
				
				"[주문내역]" + System.lineSeparator() +
				orderInfo + System.lineSeparator() + System.lineSeparator() +
				
				"[입금전용계좌]" + System.lineSeparator() +
				"▷ " + bank_name + " " + bank_account + System.lineSeparator() +
				"▷ " + totalprice + "원 (예금주 " + bank_username + ")" + System.lineSeparator() + System.lineSeparator() +
				
				"■ 포만감의 소식은 플친에서 확인!" + System.lineSeparator() +
				"http://pf.kakao.com/_xlxbhlj " + System.lineSeparator() +
				"(광고성정보 포함)";
		
		System.out.println(text);
		
		/*
		Object obj = BizmApi.send(phone_number, text, tmplId).getBody();
		Gson gson = new Gson();
		List<ApiResultBean> bean = gson.fromJson(obj+"", new TypeToken<List<ApiResultBean>>() {}.getType());
		if(!bean.get(0).getCode().equals("success")) {
			// fail
			
		} else {
			// success
			
		}
		*/
	}
	
	public void setStatusDone() throws Exception {
		int hour = Calendar.getInstance().get(Calendar.HOUR);
		if(Calendar.getInstance().get(Calendar.AM_PM) == Calendar.PM) {
			hour += 12;
		}
		//System.out.println(hour);
		sqlUpdate("UPDATE payment_index SET status = 3 WHERE receive_date = ? AND receive_time = ? AND status = 1;", 
				Date.getCurDay(), hour+"시");
	}
	
	public static void main(String...args) {
		try {
			new PaymentIndexCrudDAO().sendOrderMsg(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setStatus(Integer status, Integer idx) throws Exception {
		sqlUpdate("UPDATE payment_index SET status = ? WHERE idx = ?", status, idx);
	}
	
	public PaymentIndexBean getBeanByIdx(Integer idx) throws Exception {
		List<Map<String, Object>> lom 
		= sqlQuery("SELECT * FROM payment_index WHERE idx = ?", idx);
		Gson gson = new Gson();
		PaymentIndexBean bean = gson.fromJson(gson.toJson(lom.get(0)), new TypeToken<PaymentIndexBean>() {}.getType());
		return bean;
	}
	
	public int getTodayOrder() throws Exception {
		List<Map<String, Object>> lom 
		= sqlQuery("SELECT count(*) FROM " + TABLENAME
				+ " WHERE timestamp > '" + Date.getCurDay() + " 00:00' "
				+ "AND timestamp < '" + Date.getCurDay() + " 24:00';");
		if(lom==null||lom.isEmpty()) 
			return 0;
		else
			return Integer.parseInt(lom.get(0).get("count(*)")+"");
	}
	
	public List<Integer> getPayNumberByGuestname(String guestname, String phonenumber, String password) throws Exception {
		List<Map<String, Object>> lom 
		= super.sqlQuery(
				"SELECT " +
					"idx " + 
				"FROM " +
					"payment_index " +
				"WHERE " +
					"(status = 0 or status = 1 or status = 2) AND receive_date = ? AND guestname = ? AND phonenumber = ? AND password = ?;", 
					Date.getCurDay(), guestname, phonenumber, password);
		
		List<Integer> result = new ArrayList<>();
		for(Map<String, Object> map : lom) {
			Object obj = map.get("idx");
			if(obj != null) {
				result.add(Integer.parseInt(obj+""));
			}
		}
		return result;
	}
	
	public List<Integer> getPayNumberByUsername(String username) throws Exception {
		List<Map<String, Object>> lom 
		= super.sqlQuery(
				"SELECT " +
					"idx " + 
				"FROM " +
					"payment_index " +
				"WHERE " +
					"(status = 0 or status = 1 or status = 2) AND receive_date = ? AND username = ?;", 
					Date.getCurDay(), username);
		
		List<Integer> result = new ArrayList<>();
		for(Map<String, Object> map : lom) {
			Object obj = map.get("idx");
			if(obj != null) {
				result.add(Integer.parseInt(obj+""));
			}
		}
		return result;
	}
	
	public int makeBoxNumber(Integer idx_target, String receive_date, String receive_time) throws Exception {
		List<Map<String, Object>> lom 
		= super.sqlQuery(
				"SELECT " +
					"max(idx_box)+1 AS nextbn " + 
				"FROM " +
					"payment_index " +
				"WHERE " +
					"idx_target = ? AND receive_date = ? AND receive_time = ?;", 
					idx_target, receive_date, receive_time);
		Object obj = lom.get(0).get("nextbn");
		if(obj == null) {
			return 0;
		} else {
			return Integer.parseInt(obj+"");
		}
	}
	
	public int getBoxNumber(Integer idx) throws Exception {
		List<Map<String, Object>> lom 
		= super.sqlQuery(
				"SELECT " +
					"idx_box " + 
				"FROM " +
					"payment_index " +
				"WHERE " +
					"idx = ?;", idx);
		return Integer.parseInt(lom.get(0).get("idx_box")+"");
	}
	
	public boolean check(Integer idx, Integer PG_price) throws Exception {
		int sumPrice = getTotalPrice(getIdxes(idx));
		boolean result = (PG_price.intValue() == sumPrice);
		if(!result) {
			logger.info("금액불일치\n"
					+ "idx : " + idx + "\n"
					+ "최종 : " + sumPrice + "\n"
					+ "PG_price : "+ PG_price + "\n"
					+ Date.getCurDate());
		}
		return result;
	}
	
	public int getTotalPrice(Integer idx_payment_index) throws Exception {
		List<Map<String, Object>> lom 
		= super.sqlQuery(
				"SELECT " +
						"totalprice " +
				"FROM " +
						"payment_index " +
				"WHERE "+
						"idx = ?;", idx_payment_index);
		return Integer.parseInt(lom.get(0).get("totalprice")+"");
	}
	
	public int getTotalPrice(String idxes_payment) throws Exception {
		int sumPrice = 0;
		for(String i : idxes_payment.split(",")) {
			List<Map<String, Object>> lom 
			= super.sqlQuery(
					"SELECT " +
							"pay.amount, pro.price, pay.additional " +
					"FROM " +
							"payment pay, product pro " +
					"WHERE "+
							"pay.idx_product = pro.idx AND pay.idx = ?;", i);
			int amount = Integer.parseInt(lom.get(0).get("amount")+"");
			int price = Integer.parseInt(lom.get(0).get("price")+"");
			int additional_total = 0;
			
			String additional = lom.get(0).get("additional")+"";
			String[] parts = additional.split(",");
			for(int j=0; j<parts.length; j++) {
				String part = parts[j];
				if(part.trim().length()>0) {
					int additional_amount = Integer.parseInt(part.split("-")[1]);
					int additional_price = Integer.parseInt(part.split("-")[2]);
					additional_total += additional_price * additional_amount;
				}
			}
			
			
			sumPrice += amount * (price + additional_total) ;
		}
		return sumPrice;
	}
	
	public String getPW(Integer idx) throws Exception {
		List<Map<String, Object>> lom 
		= super.sqlQuery(
				"SELECT " +
						"password " +
				"FROM " +
						"payment_index " +
				"WHERE "+
						"idx = ?;", idx);
		return (String) lom.get(0).get("password");
	}
	
	public void transactionFail(Integer idx) throws Exception {
		super.sqlUpdate(
				"UPDATE " +
						"payment_index " +
				"SET " +
						"idx_box= ? " +
				"WHERE "+
						"idx = ?;", null, idx);
	}
	
	public String getIdxes(Integer idx) throws Exception {
		String result = null;
		List<Map<String, Object>> lom 
		= super.sqlQuery(
				"SELECT idxes_payment FROM payment_index WHERE idx=?", idx);
		if(!lom.isEmpty()) {
			result = (String) lom.get(0).get("idxes_payment");
		}
		return result;
	}
	
	public int getSum(String[] idxes) throws Exception {
		int sum = 0;
		for(String idx : idxes) {
			List<Map<String, Object>> lom 
			= super.sqlQuery(
					"SELECT " +
							"pay.amount, pro.price " +
					"FROM " +
							"payment pay, product pro " +
					"WHERE "+
							"pay.idx_product = pro.idx AND pay.idx = ?;",idx);
			int amount = Integer.parseInt(lom.get(0).get("amount")+"");
			int price = Integer.parseInt(lom.get(0).get("price")+"");
			sum += amount * price;
		}
		
		return sum;
	}
}
