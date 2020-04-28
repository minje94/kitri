package flyExample;

public class Airplain implements Fly {
	@Override
	public boolean isAnimal() {
		return false;
	}
	
	public void fly() {
		System.out.println("Airplain Fly");
	}
}
