package callby;

public class Call {
	int x;
	
	public Call() {
		x = 10;
	}
	
	//call by value
	public void changeVar(int y) {
		x = y;
	}
	
	//call by reference ��ü�� �Ѱ��ָ� �ּҰ��� �Ѱ��ִ� ���̴�.
	public void changeRef(Call c) {
		c.x = 20;
	}
}
