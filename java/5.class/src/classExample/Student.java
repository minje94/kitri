package classExample;

public class Student {
	
	//������(constructor) -> �ڵ�����
	Student(String _name)
	{
		name = _name;
	}
	
	//�ʵ�(field)
	String name = "Tom";

	
	//�޼���(method)
	void run() {
		System.out.println(name + "�� �޸���.");
	}
}
