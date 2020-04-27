package classExample;

public class StudentExample {

	public static void main(String[] args) {
	//static이 있으면 인스턴스를 만들지 않아도 메모리에 올라간다.
		Student tom = new Student("yeo"); //()가 있으면 메서드다. 따라서 Student의 생성자를 호출하는 부분이다.
		
		System.out.println(tom.name); //필드값 호출
		tom.run(); //메서드 호출
		
		Student david = new Student("david");
		
		System.out.println(david.name); //필드값 호출
		david.run(); //메서드 호출		
	}
}
