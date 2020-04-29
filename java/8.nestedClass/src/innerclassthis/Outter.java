package innerclassthis;

public class Outter {
	String field = "Outter";
	
	void method() {
		System.out.println("Outter method");
	}
	
	void print() {
//		this = Outter
		System.out.println(this.field);
		this.method();
		
		System.out.println(Outter.this.field);
		Outter.this.method();
	}
	
	class Nested{
		String field = "Nested";
	
		void method() {
			System.out.println("Nested method");
		}
		
		void print() {
//			this = Nested
			System.out.println(this.field);
			this.method();
			
			System.out.println(Outter.this.field);
			Outter.this.method();
		}
	}
	

	
	public static void main(String[] args) {
		Outter out = new Outter();
		Outter.Nested nest = out.new Nested();
		out.print();
		nest.print();
	}
}
