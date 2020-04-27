package arrayExample;

import java.util.Scanner;

public class Exercise09 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		boolean run = true;
		int studentNum = 0;
		int [] scores = null;
		Scanner sc = new Scanner(System.in);
		
		while(run) {
			System.out.println("------------------------------");
			System.out.println("1.�л��� | 2.�����Է� | 3.��������Ʈ | 4.�м� | 5.����");
			System.out.println("------------------------------");
			System.out.print("����> ");
			
			int selectNo = sc.nextInt();
			
			if(selectNo == 1) {
				System.out.print("�л� ��> ");
				studentNum = sc.nextInt();
				scores = new int[studentNum];
				
			}
			else if(selectNo == 2) {
				if(studentNum > 0) {
					for(int i=0; i<studentNum; i++) {
						System.out.print("scores["+ i + "]: ");
						scores[i] = sc.nextInt();
					}
				}
				else {
					System.out.println("�л����� ���� �Է��ϼ���.");
				}	
			}
			else if(selectNo == 3) {
				if(scores != null) {
					for(int i=0; i<studentNum; i++) {
						System.out.println("score["+ i + "]: " + scores[i]);
					}
				}
			}
			else if(selectNo == 4) {
				int max = 0, sum = 0;
				double avg = 0;
				for(int i=0; i<studentNum; i++) {
					sum = sum + scores[i];
					if(scores[i] > max) {
						max = scores[i];
					}
				}
				avg = (double) (sum/studentNum);
				System.out.println("�ְ� ����: " + max);
				System.out.println("��� ����: " + avg);
				
			}
			else if(selectNo == 5) {
				run = false;
			}
		}
		System.out.println("���α׷� ����");
	}

}
