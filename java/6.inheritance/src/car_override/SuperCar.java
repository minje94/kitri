package car_override;

public class SuperCar extends Car {
	SuperCar(){
		super();
		System.out.println("SuperCar()");
	}
	
	@Override
	void run() {
		System.out.println("��û ���� �޸���.");
		super.run();
	}
}
