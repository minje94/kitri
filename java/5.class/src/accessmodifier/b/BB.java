package accessmodifier.b;
import accessmodifier.a.AA; //�ٸ� ��Ű���� import�ϴ� ���.

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
