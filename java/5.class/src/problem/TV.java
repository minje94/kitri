package problem;

public class TV {
	int volume;
	int channel;
	boolean mute = false;
	TV () {	}
	
	void powerOn() {
		System.out.println("TV가 켜졌습니다.");
		System.out.println("현재 채널: " + this.channel + ", 현재 볼륨: " + volume);
	}
	
	void powerOff() {
		System.out.println("TV가 꺼졌습니다. ");	
	}
	
	void channelUp () {
		if(this.channel + 1 == 21) {
			this.channel = 1;
		}
		else {
			this.channel = this.channel + 1;
		}
		System.out.println("현재 채널: " + this.channel);
	}

	void channelDown () {
		if(this.channel - 1 == 0) {
			this.channel = 20;
		}
		else {
			this.channel = this.channel - 1;
		}
		System.out.println("현재 채널: " + this.channel);
	}
	
	void channelChange(int channel) {
		if(channel >20 && channel <0) {
			System.out.println("채널을 다시 입력해주세요.");
		}
		else {
			this.channel = channel;
			System.out.println("현재 채널: " + this.channel);
		}
	}
	
	void volumeUp () {
		if(this.volume + 1 == 20) {
			System.out.println("현재 볼륨은 20입니다.");
		}
		else {
			this.volume = this.volume + 1;
			System.out.println("현재 볼륨: " + this.volume);
		}
	}
	
	void volumeDown () {
		if(this.volume + 1 == 20) {
			System.out.println("현재 볼륨은 0입니다.");
		}
		else {
			this.volume = this.volume - 1;
			System.out.println("현재 볼륨: " + this.volume);
		}	
	}
	
	void mute () {
		if(mute == false) {
			System.out.println("mute를 누르셨습니다.");
			mute = true;
		}
		else {
			System.out.println("현재 볼륨은: " + this.volume);
			mute = false;
		}
	}
}
