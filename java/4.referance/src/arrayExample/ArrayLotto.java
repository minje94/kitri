package arrayExample;

public class ArrayLotto {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [] lottoArr = new int [6];
		
		for(int i=0; i<6; i++) {
			lottoArr[i] = (int)(Math.random()*45)+1;
			
			for(int j=0; j<i; j++) {
				
				if(lottoArr[j] == lottoArr[i]) {
					i = i-1;
					break;
				}
			}
		}
		for(int i=0; i<lottoArr.length; i++) {
			System.out.print(lottoArr[i] + " ");
		}
		
		
		//2번째 방법.
		int [] number = new int[45];
		
		for(int i=0; i<number.length; i++) {
			number[i] = i+1;
		}
		int [] lottoArr2 = new int [6];
		
		for(int i=0; i<6; i++) {
			int numi = (int)(Math.random()*45);
			
			if(number[numi] != 0) {
				lottoArr2[i] = number[numi];
				number[numi] = 0;
			}
			else {
				i--;
			}
		}
		System.out.println("");
		for(int i=0; i<lottoArr.length; i++) {
			System.out.print(lottoArr2[i] + " ");
		}
	}
}
