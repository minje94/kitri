package accessmodifier.tvsolution;

public class TV {
	private boolean power = false;
	boolean mute = false;
	int tempVol = 0;
	private int channal = 7;
	private int volume = 3;
	final int maxVol = 20;
	final int minVol = 0;
	final int maxCh = 100;
	final int minCh = 1;
	
	void PowerOn() {
		power = true;
		System.out.println("TV ON!!");
	}
	
	void PowerOff() {
		power = false;
		System.out.println("TV OFF!!");
	}
	
	int chUp() {
		if(power == true) {
			if (channal == maxCh) {
				channal = minCh;
			}
			else {
				channal++;
			}
		}
		System.out.println("channal : " + channal);
		return channal;
	}
	
	int chDown() {
		if(power == true) {
			if (channal == minCh) {
				channal = maxCh;
			}
			else {
				channal--;
			}
		}
		System.out.println("channal : " + channal);
		return channal;
	}
	
	int changeCh(int ch) {
		if(power) {
			if((ch >= minCh) && (ch <=maxCh)) {
				channal = ch;
			}
			else {
				System.out.println(ch + "은 적절한 입력이 아닙니다.");
			}
		}
		System.out.println("channal : " + channal);
		return channal;
	}
	
	int volUp() {
		if(power) {
			if(volume == maxVol) {
				System.out.println("최대볼륨입니다.");
			}
			else {
				volume++;
			}
		}
		System.out.println("Volume : " +  volume);
		return volume;
	}
		
	int volDown() {
		if(power) {
			if(volume == minVol) {
				System.out.println("최소볼륨입니다.");
			}
			else {
				volume--;
			}
		}
		System.out.println("Volume : " +  volume);
		return volume;
	}
	void setMute() {
		if(power) {
			if(!mute) {
				mute = true;
				tempVol = volume;
				volume = 0;
				System.out.println("음소거 입니다.");
			}
			else{
				mute = false;
				volume = tempVol;
				tempVol = 0;
				System.out.println("현재볼륨: " + volume);
			}
		}
	}
	void check() {
		System.out.println("현재 채널: " + this.channal + ", 현재 볼륨: " + this.volume);
		
	}
}
