package arrayExample;

public class ArrExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [] arrInt = {90,80,70};
		
		int sum = 0;
		
		for(int i=0; i<3; i++) {
			System.out.println(arrInt[i]);
			sum = sum + arrInt[i];
		}
		
		System.out.println(sum);
		System.out.println(arrInt.length);
		System.out.println(sum /(arrInt.length));
		
	}

}
