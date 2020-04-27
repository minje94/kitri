package car_override;

public class Car {
	
	Car(){
		System.out.println("Car()");
	}
	
	//final을 사용하여 상속을 막을 수 있다. 
	void run() {
		System.out.println("달리다.");
	}
}
