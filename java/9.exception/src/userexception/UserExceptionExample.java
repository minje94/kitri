package userexception;

public class UserExceptionExample {

	public static void main(String[] args) {
		int i=0;
		if(i==0) {
			try {
				throw new UserException("����ó�� �߻�");
			}
			catch(UserException us) {
				us.printStackTrace();
			}
		}
	}

}
