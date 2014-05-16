package com.wisdom.code.converter.impl;

import com.wisdom.code.converter.INameConverter;

public class DefaultNameConverter implements INameConverter {

	public String convert(String name) {
		if (name == null) {
			return "";
		}
		
		StringBuffer reslut = new StringBuffer(40);
		name = name.toLowerCase();
		String[] wordList = name.split("_");
		int index = 0;
		for (String tmp : wordList) {
			if ("id".equals(tmp) || "no".equals(tmp)) {
			    if (index == 0) {
                    reslut.append(upperFirst(tmp));
                } else {
				    reslut.append(tmp.toUpperCase());
                }
				index++;
				continue;
			} else if (index == 0 && "rims".equals(tmp)) {
				index++;
				continue;
			} else {
				reslut.append(upperFirst(tmp));
				index++;
			}
		}

		return reslut.toString();
	}
	
	public String convertDef(String name) {
		if (name == null) {
			return "";
		}
		
		StringBuffer reslut = new StringBuffer(40);
		name = name.toLowerCase();
		String[] wordList = name.split("_");
		int index = 0;
		for (String tmp : wordList) {
			if ("id".equals(tmp) || "no".equals(tmp)) {
				if (index == 0) {
					reslut.append(tmp);
				} else {
					reslut.append(tmp.toUpperCase());
				}
				index++;
				continue;
			} else if (index == 0 && "rims".equals(tmp)) {
				index++;
				continue;
			} else {
				reslut.append(upperFirst(tmp));
				index++;
			}
		}

		return reslut.toString();
	}

	private static String upperFirst(String value) {
		String result = value;
		if (value != null && value.length() > 0) {
			result = value.substring(0, 1).toUpperCase() + value.substring(1);
		}
		return result;
	}
}
