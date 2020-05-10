package trycatchexample;

public class TryCatchFinallyExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			//NumberFormatException
			String data1 = "100";
			String data2 = "a100";
			
			int int1 = Integer.parseInt(data1);
			int int2 = Integer.parseInt(data2);
			
			//ArrayIndexOutOfBoundsException
			String [] sArr = new String[5];
			
			sArr[5] = "100";
			
		}
		catch(NumberFormatException e){
			System.out.println("NumberFormatException 발생");	 //예외발생생
		}
		
		catch(ArrayIndexOutOfBoundsException e){
			System.out.println("ArrayIndexOutOfBoundsException 발생");	 //예외발생생
		}
		finally{
			System.out.println("프로그램 종료");	//무조건 실행되는 부분
		}
	}

}
