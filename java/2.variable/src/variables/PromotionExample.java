package variables;

public class PromotionExample {
	public static void main(String[] args) {
		byte byteValue = 10; //1byte
		
		//�Ѵ� byteŸ�������� �ڵ��� ��ȯ��.
		int intValue = byteValue + byteValue;
		
		char charValue = 'a'; //���� �ƽ�Ű �ڵ尪�� ����.
		intValue = charValue;
		System.out.println(intValue);
	
		intValue = 500;
		long longValue = intValue;
		System.out.println(longValue);
		
		intValue = 200;
		double doubleValue = intValue; // 8byte <- 4byte
		System.out.println(doubleValue);
		
		//longValue = 839172111113; //���ڸ� int������ ó���ϱ� ������ ����.
		longValue = 839172111;
		doubleValue = longValue;
		System.out.println(doubleValue);

	}
}
