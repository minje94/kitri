package multiinterfaceinheritance;

public interface B extends A{
	@Override 
	default void method1() {
		System.out.println("hi");
	};
}
