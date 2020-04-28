package arrayList;

public class ArrayListExample {
	public static void main(String[] args) {
		ArrayListClass array = new ArrayListClass();
		
		array.add("A");
		array.printArray();
	
		array.add("B");
		array.printArray();
		
		array.add("C");
		array.printArray();
		
		array.add("D");
		array.printArray();
		
		array.add("E");
		array.printArray();
		
		array.add("F", 1);
		array.printArray();
		
		array.add("G");
		array.printArray();
		

		array.delete(1);
		array.printArray();
	}
}
