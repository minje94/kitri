package abstractExample;

public class Farm {

	public static void main(String[] args) {
//		Animal animal = new Animal(); 추상클래스는 생성자를 호출할 수 없다.
		
		//#1
		Pig pig = new Pig();
		pig.sound();
		Horse horse = new Horse();
		horse.sound();
		
		//#2
		Animal animal;
		animal = new Pig();
		animal.sound();
		
		animal = new Horse();
		animal.sound();
	
		//#3
		animalSound(new Pig());
		animalSound(new Pig());
	}
	
	public static void animalSound(Animal animal) {
		animal.sound();
	}
}
