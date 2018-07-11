@isTest
public class Test_Example_4 {
	@isTest
    static void testMe(){
        Apex_Example_4 ae =new Apex_Example_4();
        ae.leadSource='Web';
        ae.setCase();
        System.assertEquals('High',ae.priority);
        System.assertEquals('New',ae.status);
        ae.leadSource='Email';
        ae.setCase();
        System.assertEquals('Low',ae.priority);
        System.assertEquals('Closed',ae.status);
    }
}