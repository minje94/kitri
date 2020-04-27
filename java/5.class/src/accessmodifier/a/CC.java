package accessmodifier.a;

public class CC {
   AA aa = new AA();
   
   void useAA() {
      //aa.a = 20;
      aa.b = 20;
      aa.c = 20;
      aa.d = 20;
      
      //aa.methodA();
      aa.methodB();
      aa.methodC();
      aa.methodD();
      
      
   }
}