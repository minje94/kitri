package condition;

public class IfExample {
	public static void main(String[] args) {
		
		int x = 10;
		if(x>5) {
			System.out.println(x + "는 5보다 큽니다.");
		}
		if(x<=5) {
			System.out.println(x + "는 5보다 작거나 같다.");
		}
		
		if(x%2 == 0) {
			System.out.println(x + "는 짝수입니다.");
		}
		
		if(x%2 != 0) {
			System.out.println(x + "는 홀수입니다.");
		}
	}
}
