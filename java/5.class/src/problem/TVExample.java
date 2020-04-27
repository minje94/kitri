package problem;
import java.util.Scanner;

public class TVExample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		TV tv = new TV();
		tv.powerOn();
		tv.volumeUp();
		tv.channelChange(20);
		tv.channelUp();
		tv.channelDown();
		tv.mute();
	}

}
