package interfaceExample;

interface aExample{
	public void sayHello();
	
}

interface bExample{
	public void sayBye();
	
}

public class InterfaceExample implements aExample, bExample {
	public void sayBye() {
		System.out.println("잘가!");
	}

	public void sayHello() {
		System.out.println("안녕!");
	}
	
	public static void main(String[] args) {
		InterfaceExample i = new InterfaceExample();
		i.sayBye();
		i.sayHello();
		
		aExample Ia = i;
//	       (관점) = (타입) 관점에 맞는 부분만 가능하다.
		Ia.sayHello();
//		Ia.sayBye();
		

		bExample Ib = i;
//		Ib.sayHello();
		Ib.sayBye();
	}
}
