package tree;

public class Node {
	private int data;
	private Node left;
	private Node right;
	
	public Node(int data) {
		this.setData(data);
	}
	
	public void setData(int data) {
		this.data = data;
	}
	
	public int getData() {
		return data;
	}
	
	public void setLeft(Node node) {
		this.left = node;
	}	
	
	public Node getLeft() {
		return left;
	}
	
	public void setRight(Node node) {
		this.right = node;	
	}

	public Node getRight() {
		return right;
	}

}
