package variable;

public class Variable_01 {
	public static void main(String[] args){
	
		//��true or false
		boolean bool; 
		
		//����
		char ch = 'a'; 
		
		//���� ����
		byte by = 127;
		System.out.println(by);
		
		short sh = 32000;
		int in = 100000;
		int in8 = 010;  //8���� 
		int in16 = 0xB;	//16����
		long lo = 2000000;
		System.out.println(in8);
		System.out.println(in16);		
		
		
		//���� �Ǽ�
		float fl = 1.1f;
		double dou = 1.1;	//�߿� floact���� double�� �ַ� ���.
		double dou2 = 2e-3; //0.002
	
		//����ȯ
		int inValue = 128;
		System.out.println(inValue);
		
		long loValue = inValue;
		System.out.println("loValue: " + loValue);
		

		byte byValue = (byte)inValue;
		System.out.println("byValue: "  + byValue);
	}
}
