package ex2446º°_Âï±â_9;
import java.util.Scanner;

public class ex2446 {
	public static void main(String[] args0) {
		Scanner sc = new Scanner(System.in);
		int length = sc.nextInt();
		
		for(int i=length; i>0; i--) {
			if(i<length) {
				for(int j=0; j<length-i; j++) {
					System.out.print(" ");
				}
			}
			for(int j=0; j<i; j++) {
				System.out.print("*");
			}
			for(int j=0; j<i-1; j++) {
				System.out.print("*");
			}
			System.out.println("");
		}
		
		for(int i=2; i<=length; i++) {
			if(i<length) {
				for(int j=0; j<length-i; j++) {
					System.out.print(" ");
				}
			}
			for(int j=0; j<i; j++) {
				System.out.print("*");
			}
			for(int j=0; j<i-1; j++) {
				System.out.print("*");
			}
			System.out.println("");
		}
	}
}
