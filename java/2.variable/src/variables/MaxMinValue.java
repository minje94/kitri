package variables;

public class MaxMinValue {
	public static void main(String[] args) {
		byte byteMax = Byte.MAX_VALUE,
			 byteMin = Byte.MIN_VALUE;
		
		short shortMax = Short.MAX_VALUE,
			  shortMin = Short.MIN_VALUE;
		
		int intMax = Integer.MAX_VALUE,
			intMin = Integer.MIN_VALUE;
	
		long longMax = Long.MAX_VALUE,
			 longMin = Long.MIN_VALUE;
	
		float floatMax = Float.MAX_VALUE,
			  floatMin = Float.MIN_VALUE;
		
		double doubleMax = Double.MAX_VALUE,
			   doubleMin = Double.MIN_VALUE;
		
		System.out.println(byteMax + " " + byteMin);
		System.out.println(shortMax + " " + shortMin);
		System.out.println(intMax + " " + intMin);
		System.out.println(longMax + " " + longMin);
		System.out.println(floatMax + " " + floatMin);
		System.out.println(doubleMax + " " + doubleMin);
	
	
	}
}
