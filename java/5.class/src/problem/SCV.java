package problem;

public class SCV {
	private int hp = 30;
	private int mp = 0;
	final int defence = 4;
	final int attack = 6;
	private int x, y;
	
	SCV () {
		System.out.println("�����ϰڽ��ϴ�." );
	}
	
	int getHP(){
		System.out.println("SCV hp: " + hp);
		return hp;
	}
	
	void attack(SCV scv) {
		System.out.println("�����մϴ�.");
		scv.hp -= this.attack;
	}
	void move(int x, int y) {
		System.out.println(x+ ", " + y + "�� �̵��մϴ�.");
		this.x = x;
		this.y = y;		
	}
	void fix(SCV scv) {
		System.out.println("SCV�� ��Ĩ�ϴ�.");
		scv.hp = 30;
	}
	
	
}
