package variables;

public class PromotionExample {
	public static void main(String[] args) {
		byte byteValue = 10; //1byte
		
		//둘다 byte타입이지만 자동형 변환됨.
		int intValue = byteValue + byteValue;
		
		char charValue = 'a'; //가의 아스키 코드값이 저장.
		intValue = charValue;
		System.out.println(intValue);
	
		intValue = 500;
		long longValue = intValue;
		System.out.println(longValue);
		
		intValue = 200;
		double doubleValue = intValue; // 8byte <- 4byte
		System.out.println(doubleValue);
		
		//longValue = 839172111113; //숫자를 int형으로 처리하기 떄문에 오류.
		longValue = 839172111;
		doubleValue = longValue;
		System.out.println(doubleValue);

	}
}
