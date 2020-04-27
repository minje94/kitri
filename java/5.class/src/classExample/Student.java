package classExample;

public class Student {
	
	//생성자(constructor) -> 자동생성
	Student(String _name)
	{
		name = _name;
	}
	
	//필드(field)
	String name = "Tom";

	
	//메서드(method)
	void run() {
		System.out.println(name + "은 달린다.");
	}
}
