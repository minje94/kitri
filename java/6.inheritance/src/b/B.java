package b;
import a.*; //패키지가 다르기 떄문에 public 이어도 import해야한다.

public class B extends A {
	//A a = new A(); protected라 해도 불가하다. super를 사용해야한다.
	
//	super.field = "yeo"; 
//	this.method();
}
