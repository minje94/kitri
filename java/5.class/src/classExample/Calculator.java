package classExample;

public class Calculator {
		public static void main(String[] args) {
			Calculator cal = new Calculator();
			cal.add(10,20);
			cal.add(10,20,30);
		}
		int result;
		
		int add(int x, int y) {
			System.out.println(x+y);
			return x+y;
		}
		
		void add(int x, int y, int z) {
			System.out.println(add(x,y) + z);
		}
		
		void mimus(int x, int y) {
			System.out.println(x-y);
		}
		
		void mux(int x, int y) {
			System.out.println(x*y);
		}
		
		void div(int x, int y) {
			System.out.println(x/y);
		}
}

