package nestedclass;

public class A { //외부에서 class B, C를 못보게 하려고 주로 사용!
	
	//필드
	B bb = new B();
	C cc = new C();
//	D dd = new D(); method()동작되어 호출되어야만 가능.

//	static B sb = new B();   B가 일반 클래스라서 불가능.
	static C sc = new C(); //C가 static 클래스라서 가능.
	
	//메소드
	void methodA() {
		B varB = new B();
		C varC = new C();
//		D varD = new D(); method()동작되어 호출되어야만 가능.
	}
	
	static void methodAs() {
//		B varB = new B();   B가 일반 클래스라서 불가능.
		C varC = new C(); //C가 static 클래스라서 가능.
//		D varD = new D(); 	method()동작되어 호출되어야만 가능.
	}
	
	
	//인스턴스 멤버 클래스
	class B{
		B(){}
		int fieldB;
		
		void methodB() {
			fieldB = 10;
			bb = new B();
			cc = new C();		
			sc = new C(); //static
			methodA();
			methodAs();	  //static
			
		}
//		static int staticField;   -->불가능
//		static void methodBs() {} -->불가능
	}
	
	//정적 멤버 클래스
	static class C{					//static은 new로 객체를 생성하지 않아도 된다.
		C(){}
		int fieldC;
		void methodC() {
			fieldC = 10;
//			bb = new B(); 	static으로 선언된 것이 아니면 불가능하다.
//			cc = new C();	static으로 선언된 것이 아니면 불가능하다.
			sc = new C(); //static으로 선언되어있기 때문에 가능.
//			methodA();		static으로 선언된 것이 아니면 불가능하다.
			methodAs();	  //static으로 선언되어있기 때문에 가능.
//			methodCs());	static으로 선언된 것이 아니면 불가능하다.
		}
		static int staticField;     //static으로 선언했기 떄문에 가능.
		static void methodCs() {};  //static으로 선언했기 떄문에 가능.
	}
	
	void method() {
		//로컬 클래스
		class D{
			D(){}
			int fieldD;
			void methodD() {
				fieldD = 10;
				bb = new B(); 	
				cc = new C();	
				sc = new C(); 
				methodA();		
				methodAs();	
				
			}
//			static int staticField;		-->불가능
//			static void methodDs() {}	-->불가능
			
		}
		
		D d = new D();
		d.fieldD = 40;
		d.methodD();
	}

	
	public static void main(String[] args) {
		A a = new A();
		
		//인스턴스 멤버
		A.B b = a.new B(); //A를 구현해놓고 B의 생성자를 만드는거니까...이렇게...
		b.fieldB = 20;
		b.methodB();
		
		//static 멤버
		A.C c = new A.C();
		c.fieldC = 30;
		c.methodC();
		
		A.C.staticField = 35;
		A.C.methodCs();
		
		//로컬
		a.method(); //D class동작
		
	}
	
	
}
