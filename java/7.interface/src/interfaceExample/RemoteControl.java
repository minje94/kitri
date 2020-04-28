package interfaceExample;

public interface RemoteControl {
	
	//상수
	public static final int MAX_VOLUEM = 10;
	int MIN_VOLUEM = 0; //상수 설정 생략
	
	//추상 메소드
	public abstract void turnOn();
	void turnOff(); // 추상 메소드 설정 생략. 그냥 추상 메소드라고 생각하면 됨.
	
	//디폴트 메소드
	default void setMute (boolean mute) {}
	
	//정적(Static) 메소드
	public static void changeBattery() {}
	static void drowRemote() {} //public 생략
	
}
