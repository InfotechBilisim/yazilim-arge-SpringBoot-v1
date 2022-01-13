package com.infotech.enums;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.infotech.config.Utils;

public enum EnumUserType {
	USERS_PRIVILEGE_0(0),
	USERS_PRIVILEGE_1(1),
	USERS_PRIVILEGE_6(6),
	USERS_PRIVILEGE_7(7),
	USERS_PRIVILEGE_8(8);

	private static Utils utils = new Utils().get();
	private final int userType;
	private static Map map = new HashMap<>();

    private EnumUserType(int value) {
        this.userType = value;
    }
	
	static {
		for (EnumUserType item : EnumUserType.values()) {
			map.put(item.userType, item);
		}
	}

	public static EnumUserType valueOf(int userType) {
		Object object = map.get(userType);
		return (EnumUserType) map.get(userType);
	}

	public int getValue() {
		return userType;
	}
	
	public static String getTranslatedValue(int value) {
		return utils.translateText(valueOf(value).toString());
	}
}
