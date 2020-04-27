package polymorphism;


public class QueueExample{
	public static void main(String[] args) {
		Queue que = new Queue();
		
		que.insert(10);
		que.insert(20);
		que.insert(30);
		que.print();
		
		System.out.println(que.peek());
		que.print();
		
		que.remove();
		que.print();
		
		//que.pop();
	}
}

class Queue {
	int [] arr = new int [5];
	int size = 0, startPointer=0, endPointer=0;
	
	void insert(int input) {
		if(size <arr.length) {
			arr[startPointer++] = input;
			startPointer = startPointer%arr.length;
			size++;
		}
		else {
			System.out.println("arr full!!");
		}
		
	}
	
	int remove() {
		int result = 0;
		
		if(size >0) {
			result = arr[endPointer];
			arr[endPointer++] = 0;
			endPointer = endPointer%arr.length;
			size--;
		}
		
		return result;
	}
	
	int peek() {
		int result = 0;
		result = arr[endPointer];
		
		return result;
	}
	
	boolean isEmpty() {
		boolean result = true;
		int count = 0; 
		for(int temp : arr) {
			if(temp != 0) {
				count++;
			}
		}
		
		if(count > 0) {
			result = false;
		}
		
		return result;
	}
	
	void print() {
		if(isEmpty() == true) {
			System.out.println("큐가 비어있습니다.");
		}
		else {
			for(int temp : arr) {
				System.out.print(temp + " ");
			}
			System.out.println();
		}
	}
}
