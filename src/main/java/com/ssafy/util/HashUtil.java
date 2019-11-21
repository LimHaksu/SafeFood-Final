package com.ssafy.util;

public class HashUtil {
	public static int hash(String str) {
		int hash = 5381;
		for(int i = 0; i < str.length(); ++i) {
			int c = (int)str.charAt(i);
			hash = ((hash << 5) + hash) + c;
		}
		if(hash < 0) hash *= -1;
		return hash;
	}
}
