package iteration;
import java.util.Scanner;

public class Exercise09 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int num = sc.nextInt();
		System.out.print(num + "�� �����: ");
		for(int i=1; i<=num; i++) {
			if(num%i == 0) {
				System.out.print(i + " ");
			}
		}
		System.out.println("");
		
		System.out.print(num + "������ �Ҽ���: ");
		for(int i=2; i<=num; i++) {
			int count = 0;
			
			for(int j=1; j<=i; j++) {
				if(i%j == 0) {
					count++;
				}
			}
			
			if(count == 2) {
				System.out.print(i + " ");
			}
		}
	}
}
