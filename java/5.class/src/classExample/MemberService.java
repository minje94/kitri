package classExample;

public class MemberService {
	String id = "hong";
	String password = "12345";
	
	boolean login(String _id, String _password) {
		if(id.equals(_id) && password.equals(_password)) {
			return true;
		}
		else {
			return false;
		}
	}
	void logout(String _id) {
		if(id.equals(_id)){
			System.out.println("�α׾ƿ� �Ǿ����ϴ�.");	
		}
		else {
			System.out.println("id�� �ٽ� �Է����ּ���.");
		}
	}
}
