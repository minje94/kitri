package arrayExample;

public class MultiArrayExample4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int count = 1;
		int [][] arr = new int [5][5];
		
		for(int i=0; i<5; i++) {
			if(i%2 !=0) {
				for(int j=4; j>=0; j--) {
					arr[i][j] = count++;
				}
			}
			else {
				for(int j=0; j<5; j++) {
					arr[i][j] = count++;
				}
			
			}
		}
		
		for(int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				System.out.print(arr[i][j] + " ");
			}
			System.out.println("");
		}
	}

}
