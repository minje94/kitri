package iteration;
import java.util.Scanner;

public class Exercise08 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int num1 = sc.nextInt();
		int num2 = sc.nextInt();
		/*
		int min = 1;

		int i= 2;
		while(true) {
			
			if(num1%i == 0 && num2%i == 0) {
				min = min * i;
				num1 = num1/i;
				num2 = num2/i;
				i = 2;
			}
			else if(i>num1 || i>num2){
				break;
			}
			else {
				i++;
			}
		}
		System.out.println("�ִ�����: " + min + ", �ּҰ����: " + min*num1*num2);
		*/
		int g = 0; //�ִ�����
		int l = 0; //�ּҰ����
		
		int minValue = (num1 < num2) ? num1 : num2;
		int maxValue = (num1 > num2) ? num1 : num2;
		
		for(int i= maxValue; i>0; i++) {
			if((i%num1 == 0) && (i%num2) == 0) {
				l = i;
				break;
			}
		}
		System.out.println("�ּҰ����: " + l);
		
		for(int i = minValue; i>0; i--) {
			if((num1%i == 0) && (num2%i == 0)) {
				g = i;
				break;
			}
		}
		System.out.println("�ִ�����: " + g);
	}
}
