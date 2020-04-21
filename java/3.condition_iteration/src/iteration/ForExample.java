package iteration;

public class ForExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 1; i < 11; i++) {
			System.out.println(i);
		}

		// 2ÀÇ ¹è¼ö
		for (int i = 1; i < 11; i++) {
			if (i % 2 == 0) {
				System.out.println(i);
			}
		}

		for (int i = 10; i > 0; i--) {
			System.out.println(i);
		}
	}

}
