package condition;

public class IfExample {
	public static void main(String[] args) {
		
		int x = 10;
		if(x>5) {
			System.out.println(x + "�� 5���� Ů�ϴ�.");
		}
		if(x<=5) {
			System.out.println(x + "�� 5���� �۰ų� ����.");
		}
		
		if(x%2 == 0) {
			System.out.println(x + "�� ¦���Դϴ�.");
		}
		
		if(x%2 != 0) {
			System.out.println(x + "�� Ȧ���Դϴ�.");
		}
	}
}
