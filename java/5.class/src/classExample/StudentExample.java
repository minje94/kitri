package classExample;

public class StudentExample {

	public static void main(String[] args) {
	//static�� ������ �ν��Ͻ��� ������ �ʾƵ� �޸𸮿� �ö󰣴�.
		Student tom = new Student("yeo"); //()�� ������ �޼����. ���� Student�� �����ڸ� ȣ���ϴ� �κ��̴�.
		
		System.out.println(tom.name); //�ʵ尪 ȣ��
		tom.run(); //�޼��� ȣ��
		
		Student david = new Student("david");
		
		System.out.println(david.name); //�ʵ尪 ȣ��
		david.run(); //�޼��� ȣ��		
	}
}
