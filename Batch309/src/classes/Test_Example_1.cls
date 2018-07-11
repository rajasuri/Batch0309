@isTest
public class Test_Example_1 {
	@isTest
    static void testMe(){
        Apex_Example_1 ae =new Apex_Example_1();
        ae.call();
        System.assertEquals('Satish',ae.name);
        System.assertEquals('Hyd',ae.city);
    }
    testmethod static void callMe(){
          Apex_Example_1 ae =new Apex_Example_1();
          ae.invoke();
          System.assertEquals('Hari',ae.name);
          System.assertEquals('Ban',ae.city);
    }
}