package interfaceExample;

interface aExample{
	public void sayHello();
	
}

interface bExample{
	public void sayBye();
	
}

public class InterfaceExample implements aExample, bExample {
	public void sayBye() {
		System.out.println("�߰�!");
	}

	public void sayHello() {
		System.out.println("�ȳ�!");
	}
	
	public static void main(String[] args) {
		InterfaceExample i = new InterfaceExample();
		i.sayBye();
		i.sayHello();
		
		aExample Ia = i;
//	       (����) = (Ÿ��) ������ �´� �κи� �����ϴ�.
		Ia.sayHello();
//		Ia.sayBye();
		

		bExample Ib = i;
//		Ib.sayHello();
		Ib.sayBye();
	}
}
