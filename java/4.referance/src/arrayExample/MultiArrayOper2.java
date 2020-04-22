package arrayExample;

public class MultiArrayOper2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [][] arr1 = {{1,2}, {3,4}};
		int [][] arr2 = {{1,2}, {3,4}};
		int [][] arr3 = new int[2][2];
		
		//规过1
		for(int i=0; i<2; i++) {
			for(int j=0; j<2; j++) {
				int temp = 0;
				
				for(int k =0; k<2; k++) {
					temp += arr1[i][k] * arr2[k][j];
				}
				
				arr3[i][j] = temp;
			}
		}

		/*
		//规过2
		arr3[0][0] = arr1[0][0] * arr2[0][0] + arr1[0][1] *arr2[1][0];
		arr3[0][1] = arr1[0][0] * arr2[0][1] + arr1[0][1] *arr2[1][1];
		arr3[1][0] = arr1[1][0] * arr2[0][0] + arr1[1][1] *arr2[1][0];
		arr3[1][1] = arr1[1][0] * arr2[0][1] + arr1[1][1] *arr2[1][1];
		*/
		for(int i=0; i<2; i++) {
			for(int j=0; j<2; j++) {
				System.out.print(arr3[i][j] + " ");
			}
			System.out.println();
		}
	}

}
