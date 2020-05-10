package userexception;

public class UserExceptionExample {

	public static void main(String[] args) {
		int i=0;
		if(i==0) {
			try {
				throw new UserException("예외처리 발생");
			}
			catch(UserException us) {
				us.printStackTrace();
			}
		}
	}

}
