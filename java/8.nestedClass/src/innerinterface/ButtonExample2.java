package innerinterface;

public class ButtonExample2 {
	public static void main(String[] args) {
		Button button = new Button();
		
		button.setOnClickListener(new Button.OnClickListener() {
			public void onClick() {
				System.out.println("��ȭ ������ �ɱ�");
			}
		});
	}
}
