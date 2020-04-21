package variables;

public class AccuracyExample {
	public static void main(String[] args) {
		
		int apple = 1;
		double pieceUnit = 0.1;
		int number = 7;
		
		double result = apple - number*pieceUnit;
		System.out.println(result);
	
		int totalPieces = apple * 10;
		int temp = totalPieces - number;
		result = temp/10.0;
		System.out.println(result);
	}
}
