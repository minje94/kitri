package condition;

public class IfElseExample {
	public static void main(String[] args) {
		int x = 10;
		
		if(x%2 == 0) {	//true
			System.out.println("¦��");
		}
		else {	//false
			System.out.println("Ȧ��");
		}
		
		int y = 7;
		
		if (y > 10) {
			System.out.println(y + "�� 10���� ũ��.");
		}
		if(y>8) {
			System.out.println(y + "�� 10���� �۰� 8���� ũ��.");
		}
		else {
			System.out.println(y + "�� 8���� �۴�.");
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
