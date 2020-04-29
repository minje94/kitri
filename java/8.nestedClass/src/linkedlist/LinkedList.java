package linkedlist;

public class LinkedList {

	Node head = null;
	Node tail = null;
	int size = 0;

	class Node {
		Node(int input) {
			this.data = input;
		}

		int data;
		Node backNode;
	}

	void print() {
		if (size > 0) {
			Node printNode = null;
			printNode = head;

			while (printNode.backNode != null) {
				printNode = printNode.backNode;
				System.out.println(printNode.data);
			}
		}else {
			System.out.println("데이터가 없습니다.");
		}
	}

	void add(int input) {
		Node newNode = new Node(input);

		if (size == 0) {
			head = newNode;
			tail = newNode;
			size++;
		} else if (size > 0) {
			tail.backNode = newNode;
			tail = newNode;
			size++;
		}
	}

	int pop() {
		if (size > 0) {
			Node popNode = null;
			popNode = head;
			int result = popNode.data;
			head = popNode.backNode;
			return result;
		} else {
			System.out.println("데이터가 없습니다.");
			return 0;
		}
	}

	boolean isEmpty() {
		boolean result = true;

		if (size > 0) {
			result = false;
		}
		return result;
	}

	public static void main(String[] args) {
		LinkedList list = new LinkedList();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		list.print();
		System.out.println();
		System.out.println(list.pop());
		System.out.println();
		list.print();
	}

}
