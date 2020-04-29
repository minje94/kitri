package innerinterface;

public class Button {
	OnClickListener listener;
	
	interface OnClickListener {
		void onClick();
	}
	
	//Ȯ�� ��ư  => �Ҵ�.
	void setOnClickListener(OnClickListener listener) {
		this.listener = listener;
		
	}
	
	void touch() {
		listener.onClick();
	}
}

class CallListener implements Button.OnClickListener {
	@Override
	public void onClick() {
		// TODO Auto-generated method stub
		System.out.println("��ȭ�ɱ�");
	};
}
