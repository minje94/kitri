package userexception;

public class UserException extends Exception{
	public UserException() {
		System.out.println("UserExceptin()");
	}
	
	public UserException (String message) {
		super(message);
		System.out.println("UserExceptin(message)");
	}
}
