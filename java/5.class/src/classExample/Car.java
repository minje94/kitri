package classExample;
import java.util.Scanner;

public class Car {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name = "Asurada";
		int speed = 0, maxSpeed = 300, minSpeed= -20;
		
		Car Asurada = new Car(name, speed);
		
		Scanner sc = new Scanner(System.in);
		System.out.print("Power (On || Off) ");
		String power = sc.nextLine();
		
		if(power.equals("On") || power.equals("on")) {
			while(true) {
				System.out.println("=================");
				System.out.println(" D | R | N | S ");
				System.out.println("=================");
				System.out.print("현재속도: " + speed + ", 기능선택> ");
				
				String action = sc.nextLine();
				
				switch (action) {
				case "D":	speed = Asurada.D(speed); break;
				case "R":	speed = Asurada.R(speed); break;
				case "N":	speed = Asurada.N(speed); break;
				case "S":	speed = Asurada.S(speed); break;
				default : 	System.out.println("");
							System.out.println("정확한 동작을 입력해주세요."); 
							System.out.println("");	
							break;
				}
			}
		}
	}
	Car	(String _name, int _speed){
		String name = _name;
		int speed = _speed;
	}

	int D(int speed) {
		return speed - 20; 
	}
	
	int R(int speed) {
		return speed + 20; 
	}
	
	int N(int speed) {
		return speed = 0; 
	}
	
	int S(int speed) {
		return speed - 20; 
	}	
}
