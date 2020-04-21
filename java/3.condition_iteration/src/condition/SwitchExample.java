package condition;

public class SwitchExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num = (int)(Math.random() * 6)+1; //1~6의 수
		switch(num) {
		
		case 1 :
			System.out.println("1이 나온다.");
			break;
		case 2 :
			System.out.println("2가 나온다.");
			break;
		case 3 :
			System.out.println("3이 나온다.");
			break;
		case 4 :
			System.out.println("4가 나온다.");
			break;
		case 5 :
			System.out.println("5가 나온다.");
			break;
		case 6 :
			System.out.println("6이 나온다.");
			break;
		default:
			System.out.println("1-6사이의 숫자가 아니.");
			break;
		}
	}
}
