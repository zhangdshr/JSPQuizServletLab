package com.mum.cs472;

public class MyTools {

	public static boolean isNumeric(String str) {
		
		if (str != null) {
			for (int i = 0; i < str.length(); i++) {
//				System.out.println(str.charAt(i));
				if (!Character.isDigit(str.charAt(i))) {
					return false;
				}
			}
			return true;
		}
		
		return false;
		
	}

}
