package com.mrporter.pomangam.common.crontab;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mrporter.pomangam.payment.dao.PaymentIndexCrudDAO;
import com.mrporter.pomangam.product.dao.ProductCrudDAO;
import com.mrporter.pomangam.restaurant.dao.RestaurantCrudDAO;

/**
 * Scheduler
 * 
 * @version 1.0 [2018. 8. 25.]
 * @author Choi
 */
@Component
public class Scheduler {
	
	@Scheduled(cron="0 30 0/1 * * *")
	public void cronScheduler() throws Exception {
		new ProductCrudDAO().resetCountSell();
		new PaymentIndexCrudDAO().setStatusDone();
	}

	@Scheduled(cron="0 30 18 * * 5")
	public void closeRestaurant() throws Exception {
		//new RestaurantCrudDAO().closeRestaurant();
	}
	
	@Scheduled(cron="0 0 18 * * 6")
	public void closeExceptionalRestaurant() throws Exception {
		new RestaurantCrudDAO().closeExceptionalRestaurant();
	}
	
	@Scheduled(cron="0 30 19 * * 0")
	public void openRestaurant() throws Exception {
		new RestaurantCrudDAO().openRestaurant();
	}
}
