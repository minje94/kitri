package throwsexception;

public class ThrowsExample  {
	public static void main(String[] args) {
		try {
			numberFormatException();
		}
		catch(Exception e) {
			System.out.println("main���� �ذ�");
		}
	}
	
	public static void numberFormatException() throws NumberFormatException{ //ȣ���� ��ҷ� ������ ����!
		
		String data1 = "100";
		String data2 = "a100";
		
		int int1 = Integer.parseInt(data1);
		int int2 = Integer.parseInt(data2);

		
		
		try {
/*
			String data1 = "100";
			String data2 = "a100";
			
			int int1 = Integer.parseInt(data1);
			int int2 = Integer.parseInt(data2);
*/
		}
		catch (Exception e) {
			System.out.println("Exception �߻�!" + e);
		}
	}
}
