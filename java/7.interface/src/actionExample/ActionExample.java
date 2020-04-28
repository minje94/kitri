package actionExample;

public class ActionExample {
	public static void main(String[] args) {
		Action action = new Action() {
			public void work() {
				System.out.println("work");
			}
		};
		action.work();
	}
}
interface Action{
	void work();
}
