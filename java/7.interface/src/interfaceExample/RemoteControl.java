package interfaceExample;

public interface RemoteControl {
	
	//���
	public static final int MAX_VOLUEM = 10;
	int MIN_VOLUEM = 0; //��� ���� ����
	
	//�߻� �޼ҵ�
	public abstract void turnOn();
	void turnOff(); // �߻� �޼ҵ� ���� ����. �׳� �߻� �޼ҵ��� �����ϸ� ��.
	
	//����Ʈ �޼ҵ�
	default void setMute (boolean mute) {}
	
	//����(Static) �޼ҵ�
	public static void changeBattery() {}
	static void drowRemote() {} //public ����
	
}
