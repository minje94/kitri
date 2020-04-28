package directindirect;

class Ai{
	void play() {
		IndirectInterface i = InstanceManage.getInstance();
		i.playIndir();
	}
}

class Bi implements IndirectInterface{

	@Override
	public void playIndir() {
		System.out.println("play in Bi");
	}
}

class InstanceManage{
	public static IndirectInterface getInstance() {
		return new Bi();
	}
}


public class Indirect {
	public static void main(String[] args) {
		Ai a = new Ai();
		a.autoPlay();
	}
}
