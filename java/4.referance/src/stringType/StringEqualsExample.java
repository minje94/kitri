package stringType;

public class StringEqualsExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str1 = "yeo";
		String str2 = "yeo";
		
		if(str1 == str2) {
//			System.out.println("stack�� ����� �ּҰ� �����մϴ�.");
		}
		
		if(str1.contentEquals(str2)) {
//			System.out.println("heap�� ����� ������ �����մϴ�.");
		}
		
		//new�� ����ϸ� heap�� ���ο� ��ü�� ����� ��!!!
		
		String str3 = new String("yeo");
		String str4 = new String("yeo");
		
		if(str1==str3) {
			System.out.println("stack�� ����� �ּҰ� �����մϴ�.");
		}
		else {
			System.out.println("stack�� ����� �ּҰ� �ٸ��ϴ�.");
		}
		
		if(str1.contentEquals(str3)) {
			System.out.println("heap�� ����� ������ �����մϴ�.");
		}
		
		System.out.println("str1: " + str1 + ", str3: " + str3);
		System.out.println("----------------------------");
	
		if(str3==str4) {
			System.out.println("stack�� ����� �ּҰ� �����մϴ�.");
		}
		else {
			System.out.println("stack�� ����� �ּҰ� �ٸ��ϴ�.");
		}
		
		if(str3.contentEquals(str4)) {
			System.out.println("heap�� ����� ������ �����մϴ�.");
		}
		
		
	}
}
