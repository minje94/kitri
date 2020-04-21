package iteration;

public class ForForExample2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int i=1; i<=9; i++) {
			for(int j=2; j<=9; j++) {
				if(j==i+1) {
					System.out.print("           ");
				}
				else if((i*j) >= 10){
					System.out.print(j + " x " + i + " = " + (i*j) + " ");
				}
				else {
					System.out.print(j + " x " + i + " = " + (i*j) + "  ");
				}
			}
			System.out.println("");
		}
	}

}
