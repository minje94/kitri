package problem;

public class SCV {
	private int hp = 30;
	private int mp = 0;
	final int defence = 4;
	final int attack = 6;
	private int x, y;
	
	SCV () {
		System.out.println("출정하겠습니다." );
	}
	
	int getHP(){
		System.out.println("SCV hp: " + hp);
		return hp;
	}
	
	void attack(SCV scv) {
		System.out.println("공격합니다.");
		scv.hp -= this.attack;
	}
	void move(int x, int y) {
		System.out.println(x+ ", " + y + "로 이동합니다.");
		this.x = x;
		this.y = y;		
	}
	void fix(SCV scv) {
		System.out.println("SCV를 고칩니다.");
		scv.hp = 30;
	}
	
	
}
