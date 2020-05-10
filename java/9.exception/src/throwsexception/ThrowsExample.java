package throwsexception;

public class ThrowsExample  {
	public static void main(String[] args) {
		try {
			numberFormatException();
		}
		catch(Exception e) {
			System.out.println("main에서 해결");
		}
	}
	
	public static void numberFormatException() throws NumberFormatException{ //호출한 장소로 오류를 던짐!
		
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
			System.out.println("Exception 발생!" + e);
		}
	}
}
