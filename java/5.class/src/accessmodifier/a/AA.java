package accessmodifier.a;

public class AA {

	private int a = 10;		//class �ȿ����� ���ٰ���.
	int b = 20;				//package �ȿ����� ���ٰ���.
	protected int c = 30;	//package + ��� �ȿ����� ���ٰ���.
	public int d = 40;		//��� ���ٰ���.

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
