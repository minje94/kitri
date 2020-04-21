package iteration;

public class WhileExample {
	public static void main(String[] args) {
		int i = 1;
		while(i<11) {
			System.out.println(i);
			i++;
		}
		
		int dan = 2;
		while( dan < 10) {
			int j = 1;
			while( j < 10) {
				System.out.println(dan + " x " + j + " = " + (dan*j));
				j++;
			}
			dan++;
		}
	}
}
