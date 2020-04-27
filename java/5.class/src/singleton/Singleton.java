package singleton;

public class Singleton {
	private static Singleton singleton = new Singleton();
			
	String className = "singleton";
	private Singleton () {};
	static Singleton getInstance() {
		return singleton;
	}
			
}
