package directindirect;

class A {
	void autoPlay(DirectInterface i) {
		i.play();
	}
}

class B implements DirectInterface{
	public void play() {
		System.out.println("play() in B");
	}
}

class C implements DirectInterface{
	public void play() {
		System.out.println("play() in C");
	}
}

public class Direct {
	public static void main(String[] args) {
		A a = new A();
		a.autoPlay(new B());
		a.autoPlay(new C());
	}
}
