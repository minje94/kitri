package polymorphism;

public class A {
	public static void main(String[] args) {
		A a = new A();
		B b = new B();
		C c = new C();
		D d = new D();
		E e = new E();
		
		A a1 = b;
		A a2 = c;
		A a3 = d;
		A a4 = e;
		
		a = b;
		a = c;
		a = d;
		a = e;
		
		B b1 = d;
		b = d;
		B b2 = new D();
		
//		B b3 =

		
	
	}
}
