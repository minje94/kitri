package exceptionExample;

public class NumberFormatExceptionExample {
	public static void main(String[] args) {
		String data1 = "100";
		String data2 = "a100";
		
		int int1 = Integer.parseInt(data1);
		int int2 = Integer.parseInt(data2);
	}
}
