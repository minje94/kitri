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
	
	//call by reference 객체를 넘겨주면 주소값을 넘겨주는 것이다.
	public void changeRef(Call c) {
		c.x = 20;
	}
}
