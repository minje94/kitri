package starcraft;

public class Worker extends Unit{
	Worker(){
		super("Worker");
		super.hp = 0;
		super.mp = 0;
	}
	
	Worker(String type){
		super(type);
		super.hp = 0;
		super.mp = 0;
	}
	
	
	void mind(int x, int y) {
		System.out.println("(" + x + ", " + y + ")" + "위치로 이동하였습니다.");
		System.out.println("미네랄을 캤다.");
	}
}
