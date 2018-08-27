package com.mrporter.pomangam.common.crontab;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.mrporter.pomangam.product.dao.ProductCrudDAO;

/**
 * Scheduler
 * 
 * @version 1.0 [2018. 8. 25.]
 * @author Choi
 */
@Component
public class Scheduler {
	
	@Scheduled(cron="0 30 0/1 * * MON-SAT")
	public void cronScheduler() throws Exception {
		new ProductCrudDAO().resetCountSell();
	}
		
}
