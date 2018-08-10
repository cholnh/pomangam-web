package com.mrporter.pomangam.common.constant;

import java.util.HashMap;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * MenuType
 * 
 * Desc : Enum field(Database value, Visible value) 
 * 
 * @version 1.0 [2018. 3. 28.]
 * @author Choi
 */
@Getter @AllArgsConstructor @NoArgsConstructor
public enum MenuType {

	SETTOP(0),
	VOD(1),	
	LIVE(2),	
	ADVERTISE(3),	
	CATEGORY(4),	
	GIFT(5),	
	GIFTLOG(6),	
	ADMIN(7),	
	AUTHORITY(8),	
	SERVERGROUP(9),	
	SERVERINFO(10),	
	SETTOPGROUP(11),	
	APP(12),	
	NOTICE(13);
	
	private Integer dbValue;
	
	public static Map<Integer, String> getIdxMap() {
		Map<Integer, String> map = new HashMap<>();
		MenuType[] types = MenuType.values();
		for(MenuType type : types) {
			map.put(type.getDbValue(), type.name());
		}
		return map;
	}
	
	public static void main(String...args) {
		MenuType[] types = MenuType.values();
		for(MenuType type : types) {
			System.out.println(type);
		}
	}
}
