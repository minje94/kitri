package multiinterfaceinheritance;

public interface A {
	void method1();
	default void method2() {
		System.out.println("hi");
	};
}
