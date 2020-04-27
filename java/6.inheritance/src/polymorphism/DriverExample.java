package polymorphism;

public class DriverExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Driver d = new Driver();
		
		d.driver(new Bus());
		d.driver(new Texi());
	}

}
