package iteration;

public class BreakExample {
	public static void main(String[] args0) {
		for(int i=1; i<11; i++) {
			if(i%2 == 0) {
				break;
			}

			System.out.println(i);
		}
	}
}
