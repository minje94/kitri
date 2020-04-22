package arrayExample;

public class MultiArrayOper {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [][] arr1 = {{1,2}, {3,4}};
		int [][] arr2 = {{1,2}, {3,4}};
		int [][] arr3 = new int [2][2];
		
		//Çà·Äµ¡¼À
		for(int i=0; i<arr3.length; i++) {
			for(int j=0; j<arr3[i].length; j++) {
				arr3[i][j] = arr1[i][j] + arr2[i][j];
			}
		}
		
		for(int i=0; i<arr3.length; i++) {
			for(int j=0; j<arr3[i].length; j++) {
				System.out.print(arr3[i][j] + " ");
			}
			System.out.println("");
		}
	}
}
