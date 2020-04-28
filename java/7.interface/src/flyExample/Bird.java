package flyExample;

public class Bird implements Fly{
	
	@Override
	public boolean isAnimal() {
		return true;
	}
	
	public void fly() {
		System.out.println("Bird Fly");
	}
}
