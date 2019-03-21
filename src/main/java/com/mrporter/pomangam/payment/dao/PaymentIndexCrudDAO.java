package com.mrporter.pomangam.payment.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrporter.pomangam.common.map.dao.MapCrudDAO;
import com.mrporter.pomangam.common.pattern.dao.Crud;
import com.mrporter.pomangam.common.util.BizmApi;
import com.mrporter.pomangam.common.util.Date;
import com.mrporter.pomangam.payment.vo.ApiResultBean;
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
		
		List<Map<String, Object>> lom 
		= sqlQuery("SELECT * FROM payment_index WHERE idx = ?", idx);
		
		if(lom==null || lom.isEmpty()) {
			return;
		}
		
		Map<String, Object> map = lom.get(0);
		
		String phone_number = map.get("phonenumber") + "";
		String tmplId = "pmg_order_info_2";
		
		String username = map.get("member_name")==null?(map.get("guestname")==null?"고객":(map.get("guestname")+"")):map.get("member_name")+"";
		String[] idxes = (map.get("idxes_payment")+"").split(",");
		
		int orderQuantity = idxes.length;
		String orderStatus = "예약완료";
		int orderNum = Integer.parseInt(map.get("idx_box")+"");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
	    java.util.Date nDate = dateFormat.parse(map.get("receive_date")+"");
	    
		Calendar cal = Calendar.getInstance();
		cal.setTime(nDate);
		
		int dayNum = cal.get(Calendar.DAY_OF_WEEK);
		String receive_date = (cal.get(Calendar.MONTH)+1) + "/" + cal.get(Calendar.DAY_OF_MONTH) + " " + getDayKor(dayNum) + "요일"; 
		String receive_time = map.get("receive_time")+"";
		String subinfo = "기숙사의 경우 10분 정도 차이가 날 수 있습니다.";
		
		List<Map<String, Object>> lom2 
		= sqlQuery(
				"SELECT pm.idx_restaurant as idx_restaurant, rs.name as name, rs.tel as tel FROM payment pm, restaurant rs WHERE idx_payment_index = ? and pm.idx_restaurant = rs.idx group by idx_restaurant;", idx);
		
		StringBuilder builder = new StringBuilder();
		
		for(int i=0; i<lom2.size(); i++) {
			Map<String, Object> map2 = lom2.get(i);
			
			String idx_restaurant = map2.get("idx_restaurant")+"";
			List<Map<String, Object>> lom21
			= sqlQuery(
					"SELECT pm.idx as idx, pd.name as name, pm.amount as amount, pm.additional as additional, pm.idx_restaurant as idx_restaurant, pm.requirement as requirement FROM payment pm, product pd " + 
					"WHERE pm.idx_product = pd.idx and pm.idx_payment_index = ? AND pm.idx_restaurant = ?", idx, idx_restaurant);
			
			builder
			.append(getNumIcon(i+1)+" ")
			.append(map2.get("name")+" (")
			.append(map2.get("tel")+")\n");
			
			for(Map<String, Object> map21 : lom21) {
				String name = map21.get("name")+"";
				int amount = Integer.parseInt(map21.get("amount")+"");
				String additional = map21.get("additional")+"";
				String requirement = map21.get("requirement")+"";
				
				String add = "";
				String[] adds = additional.split(",");
				for(int j=0; j<adds.length; j++) {
					String parts = adds[j];
					String[] p = parts.split("-");
					if(p.length >= 4) {
						add += "    - " + p[3] + " (" + (Integer.parseInt(p[1])*amount) + "개)\n";
					}
				}
				
				builder
				.append("    - "+name+" ("+amount+"개)\n")
				.append(add);
				if(!requirement.equals("")) {
					builder.append("    - "+requirement+"\n");
				}
			}
		}
		MapCrudDAO mapDAO = new MapCrudDAO();
		String bank_name = mapDAO.getValue("bank_name");
		String bank_account = mapDAO.getValue("bank_account");
		String bank_username = mapDAO.getValue("bank_username");
		int totalprice = Integer.parseInt(map.get("totalprice")+"");
		String info = 	"포만감의 소식은 플친에서 확인!" + System.lineSeparator() +
						"■ 주문문의 : 플친 → [채팅하기]" + System.lineSeparator() +
						"http://pf.kakao.com/_xlxbhlj\n";
		
		String text = 
				"[포만감 주문안내]" + System.lineSeparator() +
				username + "님의 주문 " + orderQuantity + "건이 '" + orderStatus + "'되었습니다." + System.lineSeparator() +
				"▷ 주문번호 : " + orderNum + "번" + System.lineSeparator() +
				"▷ 도착시간 : " + receive_time + " (" + receive_date + ")" + System.lineSeparator() +
				"※ " + subinfo  + System.lineSeparator() + System.lineSeparator() +
				
				"[주문내역]" + System.lineSeparator() +
				builder.toString() + System.lineSeparator() +
				
				"[입금전용계좌]" + System.lineSeparator() +
				"▷ " + bank_name + " " + bank_account + System.lineSeparator() +
				"▷ " + totalprice + "원 (예금주 " + bank_username + ")" + System.lineSeparator() + System.lineSeparator() +
				
				"[안내문]" + System.lineSeparator() +
				"■ " + info;
		
		//System.out.println(text);
		
		Object obj = BizmApi.send(phone_number, text, tmplId).getBody();
		Gson gson = new Gson();
		List<ApiResultBean> bean = gson.fromJson(obj+"", new TypeToken<List<ApiResultBean>>() {}.getType());
		if(!bean.get(0).getCode().equals("success")) {
			// fail
		} else {
			// success
		}
		
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
			new PaymentIndexCrudDAO().sendOrderMsg(4181);
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
	
	private String getDayKor(int dayNum) {
		String day = "";
		switch(dayNum){
        case 1:
            day = "일";
            break ;
        case 2:
            day = "월";
            break ;
        case 3:
            day = "화";
            break ;
        case 4:
            day = "수";
            break ;
        case 5:
            day = "목";
            break ;
        case 6:
            day = "금";
            break ;
        case 7:
            day = "토";
            break ;
		}
		return day;
	}
	
	private String getNumIcon(int n) {
		if(n<=0 || n>10) return n+"";
		String sb = "";
		switch(n){
        case 1:
        	sb = "①";
            break ;
        case 2:
        	sb = "②";
            break ;
        case 3:
        	sb = "③";
            break ;
        case 4:
        	sb = "④";
            break ;
        case 5:
        	sb = "⑤";
            break ;
        case 6:
        	sb = "⑥";
            break ;
        case 7:
        	sb = "⑦";
            break ;
        case 8:
        	sb = "⑧";
            break ;
        case 9:
        	sb = "⑨";
            break ;
        case 10:
        	sb = "⑩";
            break ;
		}
		return sb;
	}
}
