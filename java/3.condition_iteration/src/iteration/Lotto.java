package iteration;

public class Lotto {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		while(true) {
			int a = (int) (Math.random() * 45) + 1;
			int b = (int) (Math.random() * 45) + 1;
			int c = (int) (Math.random() * 45) + 1;
			
			if(a != b & a != c & b != c) {
				System.out.println("[" + a + ", " + b + ", " + c + "]");
				break;
			}
		}
		*/
		
		int num1, num2, num3;
		
		do {
			num1 = (int) (Math.random() * 45) + 1;
			num2 = (int) (Math.random() * 45) + 1;
			num3 = (int) (Math.random() * 45) + 1;
			
		}while(num1 == num2 || num1 == num3 || num2 == num3);

		System.out.println("[" + num1 + ", " + num2 + ", " + num3 + "]");
	}

}
