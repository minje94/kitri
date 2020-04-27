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
			System.out.println("로그아웃 되었습니다.");	
		}
		else {
			System.out.println("id를 다시 입력해주세요.");
		}
	}
}
