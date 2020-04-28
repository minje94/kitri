package laptop;

public class LabTopExample {

	public static void main(String[] args) {
		LabTop laptop = new LabTop();
		USB usb = null;
		LANCard lanCard = null;
		Bluetooth bluetooth = null;
		
		usb = laptop;
		lanCard = laptop;
		bluetooth = laptop;
	
//		USB usb2 = new USB(); 생성자가 없으므로 불가하다.
//		LANCawrd lanCard2 = new LANCard();
//		Bluetooth bluetooth2 = new Bluetooth();
	
	}
}
