package starcraft;

public class Unit {
	int hp, mp;
	int x, y;
	String type;
	
	Unit(String type){
		this.type = type;
	}
	
	void attack() {
		
	}
	
	void move(int x, int y) {
		System.out.println("(" + x + ", " + y + ")" + "��ġ�� �̵��Ͽ����ϴ�.");
	}
	
}
