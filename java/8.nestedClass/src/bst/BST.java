package bst;

public class BST {
	Node root = null;
	
	class Node {
		char data;
		Node left;
		Node right;
	}

	Node insertNode(Node root, char input) {
		Node disNode = root;
		Node newNode = new Node();

		newNode.data = input;
		newNode.left = null;
		newNode.right = null;

		if (disNode == null) {
			return newNode;
		} else if (disNode.data < newNode.data) {
			//left
			disNode.left = insertNode(disNode.left, input);
			return disNode;
		} else if (disNode.data > newNode.data) {
			//right
			disNode.right = insertNode(disNode.right, input);
			return disNode;
			
		} else {
			return disNode;
		}

	}

}
