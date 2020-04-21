package ex1244_최대상금;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class Ex1244 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		//int testCase = sc.nextInt();
	
		for(int i=0; i<1; i++) {
			String [] numArr = sc.next().split("");
			String [] originArr = new String[numArr.length];
			
			for(int j=0; j<originArr.length; j++) {
				originArr[j] = numArr[j];
			}
			//int changeNum = sc.nextInt();
			
			//array reverse 
			Arrays.sort(numArr);
			List <String> list = Arrays.asList(numArr);
			Collections.reverse(list);
			
			numArr = list.toArray(new String[list.size()]);
			
			for(int j=0; j<numArr.length; j++) {
				System.out.print(originArr[j] + " ");
			}
			System.out.println("");
			for(int j=0; j<numArr.length; j++) {
				System.out.print(numArr[j] + " ");
			}
			
			
		}
	}
}
