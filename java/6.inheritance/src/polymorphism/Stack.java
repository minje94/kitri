package polymorphism;

public class Stack {
	int [] arr = new int [5];
	int size = 0;
	
	int pop() {
		int result = 0;
		if(!isEmpty()) {
			result = arr[size--];
			arr[size] = 0;
		}
		return result;
	}
	
	void push(Object obj) {
		if(size < arr.length) {
			arr[size++] = (int) obj;
		}
		else {
			System.out.println("stack full!!");
		}
	}
	
	boolean isEmpty() {
		boolean result = true;
		int count = 0;
		
		for(int temp : arr) {
			if(temp != 0) {
				count++;
			}
		}
		if(count>0) {
			result =  false;
		}	
		return result;
	}
	
	void print() {
		if(isEmpty() == true) {
			System.out.println("스택이 비어있습니다.");
		}
		else {
			for(int temp : arr) {
				System.out.print(temp + " ");
			}
		}
	}
}
