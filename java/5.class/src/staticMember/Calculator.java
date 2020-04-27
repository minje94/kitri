package staticMember;

public class Calculator {
	double ppi = 3.14159;
	
	double result = pi * plus(10,20);
	
	static double pi = 3.14159;
	
	static int plus(int x, int y) {
		return x + y;
	}
}
