package iteration;

public class ForExample3 {
	public static void main(String[] args) {
		
		for(int i=1; i<=100; i++) {
			if(i%10 == 0) {
				System.out.print(i + "\n");
			}
			else
				System.out.print(i + " ");
		}
	}
}
