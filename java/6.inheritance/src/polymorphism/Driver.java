package polymorphism;

public class Driver {
	
	//Overload
	void driver(Bus bus) {
		bus.run();
		bus.price();
	}
	
	void driver(Texi texi) {
		texi.run();
		texi.price();
	}
	
	void driver(Vehicle v) {
		v.run();
//		v.price(); Vehicle에는 price()가 없기 때문에 오류가 발생.
	}
}
