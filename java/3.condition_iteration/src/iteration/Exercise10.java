package iteration;

public class Exercise10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int countAll = 0, countP = 0, countC = 0;
		
		for(int i=1; i<=5; i++) {
			for(int j=1; j<=5; j++) {
				for(int k=1; k<=5; k++) {
					countAll++;

					if(i!=j && i!=k && k!= j) {
						countP++;
					}
					
					if(i<j && j<k) {
						countC++; //������ �ڸ��� ���� ���� ũ�⸦ ���Ͽ� count�ϵ��� ���ϸ� ��.
					}
				}
			}
		}
		System.out.println("��� ����� ��: " + countAll);
		System.out.println("���� ��: " + countP);
		System.out.println("���� ��: " + countC);
	}
}
