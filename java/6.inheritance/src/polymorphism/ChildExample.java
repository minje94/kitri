package polymorphism;

public class ChildExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Parent p = new Child();
		p.method1();
		p.method2();
		
		if(p instanceof Child) { 
			//p�� child�� ��ü�� ���� �ִ��� Ȯ���ϴ� �κ�.
			Child c = (Child)p;
			c.method1();
			c.method2();
			c.method3();	
		}
	}
}
