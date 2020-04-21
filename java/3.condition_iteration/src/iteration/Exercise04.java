package iteration;

public class Exercise04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int A = 0, B = 0;
		
		while(true) {	
			A = (int) (Math.random()*6) + 1;
			B = (int) (Math.random()*6) + 1;
			System.out.println("(" + A + ", " + B + ")");
		
			if((A+B) == 5) {
				break;
			}
		}		
	}
}
