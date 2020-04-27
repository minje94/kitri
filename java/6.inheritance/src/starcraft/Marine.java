package starcraft;

public class Marine extends Solider {
	Marine(){
		super("Marine");
		this.hp = 50;
	}
	
	void stimpack() {
		System.out.println("stimpack() ");
	}
	
	void attack( Unit unit) {
		if(this.hashCode() != unit.hashCode()) {
			unit.hp -= 10;
		}
	}
}
