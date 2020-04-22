package arrayExample;

public class AdvancedForExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		for(임시 변수 : [배열] ) {
//			
//		}
		
		int [] score = {95,71,84,93,87};
		
		int sum = 0;
		for(int s: score) {
			sum = sum + s;
		}
		System.out.println(sum);
	}

}
