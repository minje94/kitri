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
		System.out.println("안녕하세요.");
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
				System.out.println("R모드가 불가합니다.");
			}
			break;
		case 'N' :
			System.out.println("mode가 'N'입니다.");
			break;
			
		case 'S' :
			if(mode == 'D' && speed > 0) {
				mode = _mode;
			}
			break;
		default :
			System.out.println("mode 뱐걍 블가");		
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
				System.out.println("최고 속도입니다. : " + speed);
			}
			speed = tempSpeed;
		}
		else if(mode == 'R') {
			if(speed == 0) {
				speed = -30;
			}
		}
		else if(mode == 'N') {
			System.out.println("mode가 'N'입니다.");
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
