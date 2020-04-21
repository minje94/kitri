package operations;

public class Operation {

	public static void main(String[] args) {
		int a = 10;
		System.out.println(a+3); //13
		System.out.println(a-3); //7
		System.out.println(a*3); //30
		System.out.println(a/3); //3
		System.out.println(a%3); //1
		
		int b = 10;
		System.out.println(b+=3);
		System.out.println(b-=3);
		System.out.println(b*=3);
		System.out.println(b/=3);
		System.out.println(b%=3);
		
		int e = 1;
		System.out.println(-e);
		System.out.println(+e);
		
		int x=10, y=10;
		int z= x++ + ++y;
		System.out.println(z);
		System.out.println(x);
		System.out.println(y);
	}

}
