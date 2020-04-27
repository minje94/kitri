package classExample;

public class Asurada {
	String name = "Asurada";
	String master = "null";
	int MaxSpeed = 300;
	int MinSpeed = -30;
	int speed = 0;
	char mode ; //D,S,N,R
	boolean power = false;
	
	Asurada(String _master){
		master = _master;
		System.out.println("�ȳ��ϼ���.");
	}
	
	void powerOn() {
		power = true;
		System.out.println("Power On");
	}
	void powerOff() {
		power = false;
		System.out.println("Power Off");
	}
	void modeChange(char _mode) {
		switch (_mode) {
		case 'D' :
			mode = _mode;
			break;
		case 'R' :
			if(speed == 0) {
				mode = _mode;
			}
			else {
				System.out.println("R��尡 �Ұ��մϴ�.");
			}
			break;
		case 'N' :
			System.out.println("mode�� 'N'�Դϴ�.");
			break;
			
		case 'S' :
			if(mode == 'D' && speed > 0) {
				mode = _mode;
			}
			break;
		default :
			System.out.println("mode ���� ��");		
			break;
		}
	}
	
	void run() {
		int tempSpeed = 0;
		
		if(mode == 'D'){
			speed += 20;
		}
		else if(mode == 'S') {
			tempSpeed = speed;
			speed = MaxSpeed;
			
			for(int i=0; i<5; i++) {
				System.out.println("�ְ� �ӵ��Դϴ�. : " + speed);
			}
			speed = tempSpeed;
		}
		else if(mode == 'R') {
			if(speed == 0) {
				speed = -30;
			}
		}
		else if(mode == 'N') {
			System.out.println("mode�� 'N'�Դϴ�.");
		}
		
	}
	void stop() {
		if(speed >= 20) {
			speed -= 20;
		}
		else {
			speed = 0;
		}
	}
	
}
