package accessmodifier.c;

public class A {
	public int field1;
	int field2;
	private int field3;

	public A() {
		field1 = 10;
		field2 = 20;
		field3 = 30;
	}

	protected A(int a, int b) {
		field1 = 10;
		field2 = 20;
		field3 = 30;

		method1();
		method2();
		method3();
	}

	A(int a) {
		field1 = 10;
		field2 = 20;
		field3 = 30;

		method1();
		method2();
		method3();
	}

	private A(int a, int b, int c) {
		field1 = 10;
		field2 = 20;
		field3 = 30;

		method1();
		method2();
		method3();
	}

	public void method1() {

	}

	void method2() {

	}

	private void method3() {

	}
}