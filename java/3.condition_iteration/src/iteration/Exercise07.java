package iteration;
import java.util.Scanner;

public class Exercise07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boolean run = true;
		
		int balance = 0;
		Scanner sc = new Scanner(System.in);
		
		while(run) {
			System.out.println("----------------------------");
			System.out.println("1.���� | 2.��� | 3.�ܰ� | 4.����");
			System.out.println("----------------------------");
			System.out.print("����> " );
			int num = sc.nextInt();
			
			if(num == 1) {
				System.out.print("���ݾ�> ");
				int money = sc.nextInt();
				
				if(money > 0) {
					balance = balance + money;
				}
				else {
					System.out.println("�Աݾ��� �������� �ʽ��ϴ�.");
				}
				System.out.println("");
				
			}
			else if(num == 2) {
				System.out.print("��ݾ�> ");
				int money = sc.nextInt();
				
				if(money <= balance && money >= 0) {
					balance = balance - money;
				}
				else {
					System.out.println("��ݾ��� �������� �ʽ��ϴ�.");
				}
				System.out.println("");
			}
			else if(num == 3) {
				System.out.println("�ܰ�> " + balance);
				System.out.println("");
			}
			else if(num == 4){
				System.out.println("");
				System.out.println("���α׷� ����");
				break;
			}
			else {
				System.out.println("");
				System.out.println("��ȣ�� Ȯ���� �ּ���.");
			}
		}
	}

}
