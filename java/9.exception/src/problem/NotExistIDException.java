package problem;

public class NotExistIDException extends Exception{
	public NotExistIDException() {}
	public NotExistIDException(String message) {
//		System.out.println("���̵� �������� �ʽ��ϴ�.");
		super(message);
	}
}
