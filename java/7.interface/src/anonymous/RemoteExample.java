package anonymous;

public class RemoteExample {
	Remote rel = new RemoteImp1();
	Remote Ire = new Remote() {
		public void turnOn() {
			System.out.println("turnOn");
		}
		public void turnOff() {
			System.out.println("turnOff");
		}
		public void setVolume(int volume) {
			System.out.println("Set: " + volume);
		}
		
		Ire.turnOn();
		Ire.turnOff();
		Ire.setVolume(10);
	}
}
