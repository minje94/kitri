package starcraft;

public class SCV extends Worker{
	
	SCV(){
		super("SCV");
		this.hp = 30;
		this.mp = 0;
	}
	
	void fix(Unit unit) {
		if(this.hashCode() != unit.hashCode()) {
			unit.hp += 10;
		}
		else {
			System.out.println("�����δ� ��ĥ �� �����ϴ�.");
		}
	}
}
