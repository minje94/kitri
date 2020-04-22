package arrayExample;

public class ArrayExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [] arrInt1 = null;
		int arrint2 [] = {90, 80, 70};
		
		double [] arrDou;
		String [] arrStr;
		
		System.out.println(arrInt1);
		
		arrInt1 = new int [3];
		arrInt1[0] = 90;
		arrInt1[1] = 80;
		arrInt1[2] = 70;
	
		for(int i=0; i<3; i++) {
			System.out.println(arrInt1[i]);
		}
	}
}
