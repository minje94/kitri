package arrayList;

import java.util.Arrays;

public class ArrayListClass implements ArrayList{
	String [] arr = new String [1];
	int index = 0;
	
	
	@Override //배열 확장.
	public void expendArray() {
		System.out.println("배열이 확장됩니다.");
		arr = Arrays.copyOf(arr, arr.length+1);
	}
	
	public void reductionArray() {
		System.out.println("배열이 축소됩니다.");
		arr = Arrays.copyOf(arr, arr.length-1);
	}

	@Override //전체 조회
	public void printArray() {
		System.out.print("배열: ");
		for(int i=0; i<arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println("");
	}

	@Override //정확한 위치 삭제
	public void delete(int index) {
		System.out.println("delete(index)");	
		int count = 0;
		
		for(int i=0; i<arr.length; i++) {
			if(arr[i] != null) {
				count++;
			}
		}
		
		if(count == arr.length) {
			for(int i=index; i<count-1; i++) {
				arr[i] = arr[i+1];
				arr[i+1] = null;
			}
		}
		else {
			for(int i=index; i<count-1; i++) {
				arr[i] = arr[i+1];
				arr[i+1] = null;
			}
		}
		reductionArray();
	}

	@Override //끝부분에 추가
	public void add(String input) {
		System.out.println("add(input)");
		if(index >= arr.length) {
			expendArray();
		}
		arr[index] = input;
		this.index++;
	}

	@Override //할당되어있는 값들 사이에서 정확한 위치에 추가
	public void add(String input, int index) {
		System.out.println("add(input, index)");
		int count = 0;
		
		for(int i=0; i<arr.length; i++) {
			if(arr[i] != null) {
				count++;
			}
		}
		
		if(count==arr.length) {
			expendArray();
			
			String temp = arr[index];
			
			for(int i=index+1; i<arr.length; i++) {
				String temp2 = arr[i];
				arr[i] = temp;
				temp = temp2;
			}
		}
		arr[index] = input;
		this.index++;
		
	}

	@Override //정확한 위치에서 추출
	public String pop(int index) {
		System.out.println("pop(index)");
		String result = "";
		
		for(int i=index; i<arr.length; i++) {
			for(int j=i+1; j<arr.length; j++) {
				String temp = arr[i];
				arr[i] = arr[j];
				arr[j] = temp;
				
				if(i == arr.length-1) {
					result = temp;
					temp = null;
				}
			}
		}
		
		int count = 0;{
			if(count <= arr.length) {
				arr = new String [count];
			}
		}
		return result;
	}
}
