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
			System.out.println("NumberFormatException �߻�");	 //���ܹ߻���
		}
		
		catch(ArrayIndexOutOfBoundsException e){
			System.out.println("ArrayIndexOutOfBoundsException �߻�");	 //���ܹ߻���
		}
		finally{
			System.out.println("���α׷� ����");	//������ ����Ǵ� �κ�
		}
	}

}
