package arrayExample;

public class MultiArrayExample2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [][] mArr = new int [2][3];
		System.out.println(mArr.length);
		System.out.println(mArr[0].length);
		
		for(int i=0; i<mArr.length; i++) { 
			
			for(int j=0; j<mArr[i].length; j++)  { 
				mArr[i][j] = i+j;
			}
		}
		

		for(int i=0; i<mArr.length; i++) { 
			
			for(int j=0; j<mArr[i].length; j++)  { 
				System.out.print(mArr[i][j] + " ");
			}
			System.out.println("");
		}
	}

}
