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
						countC++; //조합은 자리에 따라 숫자 크기를 비교하여 count하도록 구하면 됨.
					}
				}
			}
		}
		System.out.println("모든 경우의 수: " + countAll);
		System.out.println("순열 값: " + countP);
		System.out.println("조합 값: " + countC);
	}
}
