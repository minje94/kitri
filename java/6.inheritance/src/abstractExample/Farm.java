package abstractExample;

public class Farm {

	public static void main(String[] args) {
//		Animal animal = new Animal(); �߻�Ŭ������ �����ڸ� ȣ���� �� ����.
		
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
