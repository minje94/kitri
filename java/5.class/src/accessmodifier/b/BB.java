package accessmodifier.b;
import accessmodifier.a.AA; //다른 패키지를 import하는 방법.

public class BB {
	AA aa = new AA();
		
	void useAA() {
//		aa.a = 20;
//		aa.b = 20;
//		aa.c = 20;
		aa.d = 20;
		
		aa.setter(20);
		System.out.println(aa);
		aa.methodD();
	}
}
