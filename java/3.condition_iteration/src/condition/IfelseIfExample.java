package condition;

public class IfelseIfExample {
	public static void main(String[] args) {
		
		int score = 84;
		/*
		if(score >= 90) {
			if(score >= 95) {
				System.out.println("A+�̴�.");
			}
			else {
				System.out.println("A�̴�.");
			}
		}
		*/
		
		if(score == 100) {
			System.out.println("A++");
		}
		else if (score >= 95) {
			System.out.println("A+");
		}
		else if(score >= 90) {
			System.out.println("A");
		}
		else {
			System.out.println("B+");
		}
	
		int gender = 1, qualification = 2;
		
		if(gender == 1) {
			
			if(qualification ==1) {
				System.out.println("����, �������Դϴ�.");
			}
			else if(qualification == 2) {
				System.out.println("����, �ܱ����Դϴ�.");
			}
			else if(qualification ==3) {
				System.out.println("����, �̼������Դϴ�.");
			}
			else {
				System.out.println("�ڰ��� �ٽ� Ȯ�����ּ���.");
			}
		}
		else if(gender == 2) {
			if(qualification ==1) {
				System.out.println("����, �������Դϴ�.");
			}
			else if(qualification == 2) {
				System.out.println("����, �ܱ����Դϴ�.");
			}
			else if(qualification ==3) {
				System.out.println("����, �̼������Դϴ�.");
			}
			else {
				System.out.println("�ڰ��� �ٽ� Ȯ�����ּ���.");
			}
		}
		else {
			System.out.println("������ �ٽ� Ȯ�����ּ���.");
		}
	}
}
