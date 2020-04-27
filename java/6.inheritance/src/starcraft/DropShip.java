package starcraft;

public class DropShip extends Unit{

	DropShip(String type){
		super(type);
	}
	Unit [] units = new Unit[5];
	int size = 0;
	
	void insert(Unit unit) {
		if(size < units.length) {
			units[size++] = unit;
			unit = null;
		}
		else {
			System.out.println("dropship full");
		}
	}
	
	Unit drop() {
		Unit result = null;
		if(size > 0) {
			result = units[size--];
			units[size] = null;
		}
		else {
			System.out.println("dropship empty!!");
		}
		return result;
	}
	
	
	void attack(Unit unit) {
		System.out.println("°ø°Ý¾ÈµÊ");
	}
	
}
