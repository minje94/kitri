package arrayExample;

public class Exersize07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int max = 0;
		int [] array = {1, 5, 3, 8, 2};
		
		for(int a : array) {
			if(a>max) {
				max = a;
			}
		}
		System.out.println("max: " + max);
		
	}

}
