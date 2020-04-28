package flyExample;

public abstract class FlyUtil{
	
	static void show(Fly fly){
		fly.fly();
		System.out.println("Animal: " + fly.isAnimal());
		
	}
	
	public static void main(String[] args) {
		show(new Bird());
		show(new Airplain());
	}
}
