package arrayExample;

public class BubbleSort {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [] arr = {10,5,9,1,8};
		
		
		for(int i=0; i<arr.length-1; i++) {
			for(int j=i+1; j<arr.length; j++) {
				if(arr[j-1] < arr[j]) {
					swap(arr, j);
				}
			}
		}
		
		print(arr);
	}
	
	public static void swap(int[] arr, int j) {
		int temp = arr[j-1];
		arr[j-1] = arr[j];
		arr[j] = temp;

	}
	
	public static void print(int[] arr) {
		for(int j=0; j<arr.length; j++) {
			System.out.print(arr[j] + " ");
		}
	}
}
