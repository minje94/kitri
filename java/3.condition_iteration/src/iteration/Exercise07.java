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
			System.out.println("1.예금 | 2.출금 | 3.잔고 | 4.종료");
			System.out.println("----------------------------");
			System.out.print("선택> " );
			int num = sc.nextInt();
			
			if(num == 1) {
				System.out.print("예금액> ");
				int money = sc.nextInt();
				
				if(money > 0) {
					balance = balance + money;
				}
				else {
					System.out.println("입금액이 적당하지 않습니다.");
				}
				System.out.println("");
				
			}
			else if(num == 2) {
				System.out.print("출금액> ");
				int money = sc.nextInt();
				
				if(money <= balance && money >= 0) {
					balance = balance - money;
				}
				else {
					System.out.println("출금액이 적당하지 않습니다.");
				}
				System.out.println("");
			}
			else if(num == 3) {
				System.out.println("잔고> " + balance);
				System.out.println("");
			}
			else if(num == 4){
				System.out.println("");
				System.out.println("프로그램 종료");
				break;
			}
			else {
				System.out.println("");
				System.out.println("번호를 확인해 주세요.");
			}
		}
	}

}
