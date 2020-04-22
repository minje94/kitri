package arrayExample;

public class ArrayCopyExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [] oldIntArr = {1,2,3};
		int [] newIntArr = new int [5];	
		
		//±Ì¿∫ ∫πªÁ. 
		for(int i=0; i<oldIntArr.length; i++) {
			newIntArr[i] = oldIntArr[i];
		}
		
		String [] oldstrArr = {"java" , "array", "copy"};
		String [] newstrArr = new String[5];
		myArrCopy(oldstrArr, 0, 
				  newstrArr, 0, 
				  oldstrArr.length);
		
//		System.arraycopy(oldstrArr, 0, 
//						 newstrArr, 0, 
//						 oldstrArr.length);
//	
		for(int i=0; i<newstrArr.length; i++) {
			System.out.println(newstrArr[i] + " ");
		}
	}
	
	public static void myArrCopy(String [] arr1, int s1, String [] arr2, int s2, int size) {
		
		while(size != 0) {
			arr2 [s2++] = arr1[s1++];
			size--;
		}
	}
}
