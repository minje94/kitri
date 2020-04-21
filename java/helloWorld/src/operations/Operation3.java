package operations;

public class Operation3 {
	public static void main(String[] args) {
		int score = 40;
		char grade;
		
		grade = (score>=90) ? 'A' : 
				(score>=80) ? 'B' : 
				(score>=80) ? 'C' : 'D';
		
		System.out.println(grade);
	}
}
