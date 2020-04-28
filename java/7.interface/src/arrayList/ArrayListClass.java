package arrayList;

import java.util.Arrays;

public class ArrayListClass implements ArrayList{
	String [] arr = new String [1];
	int index = 0;
	
	
	@Override //�迭 Ȯ��.
	public void expendArray() {
		System.out.println("�迭�� Ȯ��˴ϴ�.");
		arr = Arrays.copyOf(arr, arr.length+1);
	}
	
	public void reductionArray() {
		System.out.println("�迭�� ��ҵ˴ϴ�.");
		arr = Arrays.copyOf(arr, arr.length-1);
	}

	@Override //��ü ��ȸ
	public void printArray() {
		System.out.print("�迭: ");
		for(int i=0; i<arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println("");
	}

	@Override //��Ȯ�� ��ġ ����
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

	@Override //���κп� �߰�
	public void add(String input) {
		System.out.println("add(input)");
		if(index >= arr.length) {
			expendArray();
		}
		arr[index] = input;
		this.index++;
	}

	@Override //�Ҵ�Ǿ��ִ� ���� ���̿��� ��Ȯ�� ��ġ�� �߰�
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

	@Override //��Ȯ�� ��ġ���� ����
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
