package accessmodifier.a;

public class AA {

	private int a = 10;		//class 안에서만 접근가능.
	int b = 20;				//package 안에서만 접근가능.
	protected int c = 30;	//package + 상속 안에서만 접근가능.
	public int d = 40;		//모두 접근가능.

	private void methodA() {
		System.out.println("methodA");
	}
	
	void methodB() {
		System.out.println("methodB");
	}
	
	protected void methodC() {	
		System.out.println("methodC");
	
	}
	
	public void methodD() {	
		System.out.println("methodD");
	
	}
	
	public void setter(int a) {
		this.a = a;
	}
	
	public int getter() {
		return a;
	}
}
