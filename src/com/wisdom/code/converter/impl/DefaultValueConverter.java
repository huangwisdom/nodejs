package com.wisdom.code.converter.impl;

import com.wisdom.code.converter.IDefaultValueConverter;

public class DefaultValueConverter implements IDefaultValueConverter {

	public String convert(String valueType) {
		if (valueType == null) {
			return "";
		}

		if (valueType.equalsIgnoreCase("INT") || valueType.equalsIgnoreCase("LONG") || valueType.equalsIgnoreCase("DOUBLE")) {
			return "";
		} else {
			return "";
		}
	}

}
