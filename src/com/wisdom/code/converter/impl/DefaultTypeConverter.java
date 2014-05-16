package com.wisdom.code.converter.impl;

import com.wisdom.code.converter.ITypeConverter;

public class DefaultTypeConverter implements ITypeConverter {

	public String convert(String type, boolean isDecimal) {
		if (type == null) {
			return "String";
		}
		
		if (type.equalsIgnoreCase("VARCHAR") 
				|| type.equalsIgnoreCase("VARCHAR2") 
				|| type.equalsIgnoreCase("CHAR")
				|| type.equalsIgnoreCase("NVARCHAR2")) {
			type = "String";
		} else if(type.equalsIgnoreCase("INT")
				||type.equalsIgnoreCase("INTEGER")) {
			type = "Integer";
		} else if(type.equalsIgnoreCase("TIMESTAMP")
				||type.equalsIgnoreCase("DATE")) {
			type = "Date";
		} else if(type.equalsIgnoreCase("LONG")) {
			type = "Integer";
		} else if(type.equalsIgnoreCase("NUMBER")) {
			if(isDecimal){
				type = "BigDecimal";
			} else {
				type = "Integer";
			}
		} else if(type.equalsIgnoreCase("DOUBLE")) {
			type = "BigDecimal";
		}
		
		return type;
	}
}
