package localclass;

public class Outter {
	public void method2 (int arg) {
		int localVar = 1;
		
		//local Class
		class localClass {
			public void method() {
//				arg=3;
//				localVar = 2;
				int result = arg + localVar;
				System.out.println("result");
			}
		}
		
		localClass lc = new localClass();
		lc.method();
	
	}
	
	
	public static void main(String[] args) {
		Outter out = new Outter();
		out.method2(2);
	}
}
