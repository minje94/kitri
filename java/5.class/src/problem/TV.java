package problem;

public class TV {
	int volume;
	int channel;
	boolean mute = false;
	TV () {	}
	
	void powerOn() {
		System.out.println("TV�� �������ϴ�.");
		System.out.println("���� ä��: " + this.channel + ", ���� ����: " + volume);
	}
	
	void powerOff() {
		System.out.println("TV�� �������ϴ�. ");	
	}
	
	void channelUp () {
		if(this.channel + 1 == 21) {
			this.channel = 1;
		}
		else {
			this.channel = this.channel + 1;
		}
		System.out.println("���� ä��: " + this.channel);
	}

	void channelDown () {
		if(this.channel - 1 == 0) {
			this.channel = 20;
		}
		else {
			this.channel = this.channel - 1;
		}
		System.out.println("���� ä��: " + this.channel);
	}
	
	void channelChange(int channel) {
		if(channel >20 && channel <0) {
			System.out.println("ä���� �ٽ� �Է����ּ���.");
		}
		else {
			this.channel = channel;
			System.out.println("���� ä��: " + this.channel);
		}
	}
	
	void volumeUp () {
		if(this.volume + 1 == 20) {
			System.out.println("���� ������ 20�Դϴ�.");
		}
		else {
			this.volume = this.volume + 1;
			System.out.println("���� ����: " + this.volume);
		}
	}
	
	void volumeDown () {
		if(this.volume + 1 == 20) {
			System.out.println("���� ������ 0�Դϴ�.");
		}
		else {
			this.volume = this.volume - 1;
			System.out.println("���� ����: " + this.volume);
		}	
	}
	
	void mute () {
		if(mute == false) {
			System.out.println("mute�� �����̽��ϴ�.");
			mute = true;
		}
		else {
			System.out.println("���� ������: " + this.volume);
			mute = false;
		}
	}
}
