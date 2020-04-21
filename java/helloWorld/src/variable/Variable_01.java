package variable;

public class Variable_01 {
	public static void main(String[] args){
	
		//논리true or false
		boolean bool; 
		
		//문자
		char ch = 'a'; 
		
		//숫자 정수
		byte by = 127;
		System.out.println(by);
		
		short sh = 32000;
		int in = 100000;
		int in8 = 010;  //8진수 
		int in16 = 0xB;	//16진수
		long lo = 2000000;
		System.out.println(in8);
		System.out.println(in16);		
		
		
		//숫자 실수
		float fl = 1.1f;
		double dou = 1.1;	//중요 floact보다 double을 주로 사용.
		double dou2 = 2e-3; //0.002
	
		//형변환
		int inValue = 128;
		System.out.println(inValue);
		
		long loValue = inValue;
		System.out.println("loValue: " + loValue);
		

		byte byValue = (byte)inValue;
		System.out.println("byValue: "  + byValue);
	}
}
