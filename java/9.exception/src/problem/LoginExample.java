package problem;

public class LoginExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			login("white", "12345");
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		try {
			login("blue", "54321");
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public static void login(String id, String password) throws WrongPasswordException, NotExistIDException {
		if(!id.contentEquals("blue")) {
			throw new NotExistIDException("���̵� �������� �ʽ��ϴ�.");
		}
		
		if(!password.contentEquals("12345")) {
			throw new WrongPasswordException("�н����尡 Ʋ���ϴ�.");
		}
	}

}
