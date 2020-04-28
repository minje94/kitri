package tree;

public class TreeExample {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Node node1 = new Node(10);
		Node node2 = new Node(20);
		Node node3 = new Node(30);
		Node node4 = new Node(40);
		Node node5 = new Node(50);
		
		node1.setLeft(node2);
		node1.setRight(node5);
		
		node2.setLeft(node3);
		node2.setRight(node4);
		
	}
}
