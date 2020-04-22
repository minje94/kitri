package stringType;

public class StringEqualsExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String str1 = "yeo";
		String str2 = "yeo";
		
		if(str1 == str2) {
//			System.out.println("stack에 저장된 주소가 동일합니다.");
		}
		
		if(str1.contentEquals(str2)) {
//			System.out.println("heap에 저장된 내용은 동일합니다.");
		}
		
		//new를 사용하면 heap에 새로운 객체를 만드는 것!!!
		
		String str3 = new String("yeo");
		String str4 = new String("yeo");
		
		if(str1==str3) {
			System.out.println("stack에 저장된 주소가 동일합니다.");
		}
		else {
			System.out.println("stack에 저장된 주소가 다릅니다.");
		}
		
		if(str1.contentEquals(str3)) {
			System.out.println("heap에 저장된 내용은 동일합니다.");
		}
		
		System.out.println("str1: " + str1 + ", str3: " + str3);
		System.out.println("----------------------------");
	
		if(str3==str4) {
			System.out.println("stack에 저장된 주소가 동일합니다.");
		}
		else {
			System.out.println("stack에 저장된 주소가 다릅니다.");
		}
		
		if(str3.contentEquals(str4)) {
			System.out.println("heap에 저장된 내용은 동일합니다.");
		}
		
		
	}
}
