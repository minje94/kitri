package factorial;

public class factorial {

	public static void main(String[] args) {
	
	}
	
	static int fac(int n) {
		if(n==1) {
			return n;
		}
		else {
			return fac(n-1) * n;
		}
	}

}
