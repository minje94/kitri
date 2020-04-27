package accessmodifier.tvsolution;

public class TVExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TV tv = new TV();
		tv.PowerOn();
		tv.check();
		tv.changeCh(11);
		tv.check();
		tv.setMute();
		tv.check();
	}

}
