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
				System.out.println(ch + "�� ������ �Է��� �ƴմϴ�.");
			}
		}
		System.out.println("channal : " + channal);
		return channal;
	}
	
	int volUp() {
		if(power) {
			if(volume == maxVol) {
				System.out.println("�ִ뺼���Դϴ�.");
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
				System.out.println("�ּҺ����Դϴ�.");
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
				System.out.println("���Ұ� �Դϴ�.");
			}
			else{
				mute = false;
				volume = tempVol;
				tempVol = 0;
				System.out.println("���纼��: " + volume);
			}
		}
	}
	void check() {
		System.out.println("���� ä��: " + this.channal + ", ���� ����: " + this.volume);
		
	}
}
