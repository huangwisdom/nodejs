package com.wisdom.code.converter.impl;

import com.wisdom.code.converter.IBooleanConverter;

public class DefaultBooleanConverter implements IBooleanConverter {
	public boolean convert(String value) {
		if (value == null) {
			return false;
		}
		if (value.trim().equalsIgnoreCase("") 
				|| value.equalsIgnoreCase("NO") 
				|| value.equalsIgnoreCase("0")) {
			return false;
		}

		return true;
	}
}
