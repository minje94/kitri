package condition;

public class SwitchProblem {
	public static void main(String [] args) {
		int score = 62;
		
		switch(score/10) {
		case 10 : 
			System.out.println("A++");
			break;
		case 9:
			if(score%10 >= 5)
				System.out.println("A+");
			else
				System.out.println("A");
			break;
		case 8:
			if(score%10 > 0)
				System.out.println("B+");
			else
				System.out.println("B");
			break;
		case 7: 
			if(score%10 > 0)
				System.out.println("C+");
			else
				System.out.println("C");
			break;
		case 6:
			if(score%10 > 0)
				System.out.println("D+");
			else
				System.out.println("D");
			break;
		default :
			System.out.println("F");
			break;
				
		}
	}
}
