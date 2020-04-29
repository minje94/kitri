package innerinterface;

public class Button {
	OnClickListener listener;
	
	interface OnClickListener {
		void onClick();
	}
	
	//확인 버튼  => 할당.
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
		System.out.println("전화걸기");
	};
}
