package condition;

public class IfElseExample {
	public static void main(String[] args) {
		int x = 10;
		
		if(x%2 == 0) {	//true
			System.out.println("짝수");
		}
		else {	//false
			System.out.println("홀수");
		}
		
		int y = 7;
		
		if (y > 10) {
			System.out.println(y + "는 10보다 크다.");
		}
		if(y>8) {
			System.out.println(y + "는 10보다 작고 8보다 크다.");
		}
		else {
			System.out.println(y + "는 8보다 작다.");
		}
		
		int score = 100;
		
		if(score >= 90) {
			if(score >= 95) {
				System.out.println("A+");
			}
			else {
				System.out.println("A");
			}
		}
		else if (score >= 80 && score <90) {
			System.out.println("B");
		}
		else if (score >= 70 && score <80) {
			System.out.println("C");
		}
		else {
			System.out.println("D");
		}
	}
}
