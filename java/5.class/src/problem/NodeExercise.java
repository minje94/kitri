package problem;

public class NodeExercise {
	public static void main(String[] args) {
		Node node1 = new Node();
		Node node2 = new Node();
		
		Node node3 = new Node();
		node1.back = node2;
		node2.front = node1;
		node2.back = node3;
		node3.front = node2;
		
		Node node4 = new Node();
		node1.back = node4;
		node4.front = node1;
		node4.back = node2;
		node2.front = node4;
		
		Node nodePtr = new Node();
		nodePtr = node1;
		
		for(int i=1; i<5; i++) {
			nodePtr.val = i;
			nodePtr = nodePtr.back;
		}
	}
}

class linkedlist{
	Node head;
	Node tail;
	
	int size = 0;
	
	void add(Node node){
		if(head == null) {
			head = node;
			size ++;
		}
		else {
			Node nodeptr = new Node();
			nodeptr = head;
			
			for(int i=0; i<size; i++) {
				nodeptr = nodeptr.back;
			}
			nodeptr.back = node;
			nodeptr.back = node;
		}
	}
	
	void print() {
		Node nodeptr = new Node();
		nodeptr = head;
		if (head != null) {
			nodeptr = head;
			for(int i=0; i<size; i++) {
				System.out.println(nodeptr.val);
				nodeptr = nodeptr.back;
			}
		}
	}
}

class Node{
	int val;
	Node back;
	Node front;
}