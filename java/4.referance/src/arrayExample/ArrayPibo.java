package arrayExample;

public class ArrayPibo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long [] arr = new long [100];
		arr[0] = 0;
		arr[1] = 1;
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		
		for(int i=2; i<100; i++) {
			arr[i] = arr[i-1] + arr[i-2];
			System.out.println(arr[i]);
		}
	}

}
