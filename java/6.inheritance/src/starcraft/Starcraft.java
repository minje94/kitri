package starcraft;

public class Starcraft {
	public static void main(String[] args) {
		SCV scv1 = new SCV();
		SCV scv2 = new SCV();
		Marine marine1 = new Marine();
		
		DropShip dropship = new DropShip("dropship");
		dropship.insert(scv1);
		dropship.insert(marine1);
		dropship.insert(scv1);
		System.out.println(dropship.drop());
		System.out.println(dropship.drop());
		System.out.println(dropship.drop());
	}
}
