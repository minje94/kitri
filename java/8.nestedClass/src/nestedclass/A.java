package nestedclass;

public class A { //�ܺο��� class B, C�� ������ �Ϸ��� �ַ� ���!
	
	//�ʵ�
	B bb = new B();
	C cc = new C();
//	D dd = new D(); method()���۵Ǿ� ȣ��Ǿ�߸� ����.

//	static B sb = new B();   B�� �Ϲ� Ŭ������ �Ұ���.
	static C sc = new C(); //C�� static Ŭ������ ����.
	
	//�޼ҵ�
	void methodA() {
		B varB = new B();
		C varC = new C();
//		D varD = new D(); method()���۵Ǿ� ȣ��Ǿ�߸� ����.
	}
	
	static void methodAs() {
//		B varB = new B();   B�� �Ϲ� Ŭ������ �Ұ���.
		C varC = new C(); //C�� static Ŭ������ ����.
//		D varD = new D(); 	method()���۵Ǿ� ȣ��Ǿ�߸� ����.
	}
	
	
	//�ν��Ͻ� ��� Ŭ����
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
//		static int staticField;   -->�Ұ���
//		static void methodBs() {} -->�Ұ���
	}
	
	//���� ��� Ŭ����
	static class C{					//static�� new�� ��ü�� �������� �ʾƵ� �ȴ�.
		C(){}
		int fieldC;
		void methodC() {
			fieldC = 10;
//			bb = new B(); 	static���� ����� ���� �ƴϸ� �Ұ����ϴ�.
//			cc = new C();	static���� ����� ���� �ƴϸ� �Ұ����ϴ�.
			sc = new C(); //static���� ����Ǿ��ֱ� ������ ����.
//			methodA();		static���� ����� ���� �ƴϸ� �Ұ����ϴ�.
			methodAs();	  //static���� ����Ǿ��ֱ� ������ ����.
//			methodCs());	static���� ����� ���� �ƴϸ� �Ұ����ϴ�.
		}
		static int staticField;     //static���� �����߱� ������ ����.
		static void methodCs() {};  //static���� �����߱� ������ ����.
	}
	
	void method() {
		//���� Ŭ����
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
//			static int staticField;		-->�Ұ���
//			static void methodDs() {}	-->�Ұ���
			
		}
		
		D d = new D();
		d.fieldD = 40;
		d.methodD();
	}

	
	public static void main(String[] args) {
		A a = new A();
		
		//�ν��Ͻ� ���
		A.B b = a.new B(); //A�� �����س��� B�� �����ڸ� ����°Ŵϱ�...�̷���...
		b.fieldB = 20;
		b.methodB();
		
		//static ���
		A.C c = new A.C();
		c.fieldC = 30;
		c.methodC();
		
		A.C.staticField = 35;
		A.C.methodCs();
		
		//����
		a.method(); //D class����
		
	}
	
	
}
